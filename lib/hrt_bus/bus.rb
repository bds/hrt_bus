module HrtBus
  class Bus
    include ActiveModel::Validations
    include ActiveModel::Serializers::JSON

    ATTRIBUTES = [ :id, :time, :lat, :lon, :route_id ]

    attr_accessor *ATTRIBUTES

    validates_numericality_of :route_id, greater_than: 0
    validates_numericality_of :lat, greater_than: 0
    validates_numericality_of :lon, less_than: 0

    validates :time, :lat, :lon, :route_id, :presence => true

    def initialize(attributes={})
      self.attributes = attributes
    end

    def attributes
      ATTRIBUTES.inject(ActiveSupport::HashWithIndifferentAccess.new) do |result, key|
        result[key] = read_attribute_for_validation(key)
        result
      end
    end

    def attributes=(attrs)
      attrs.each_pair do |k, v|
        send("#{k}=", v)
      end
    end

    def read_attribute_for_validation(key)
      send(key)
    end

    def static_map
      map = GoogleStaticMap.new(:width => 960, :height => 640)
      map.markers << MapMarker.new(:color => "blue",
                                   :location => MapLocation.new(:latitude => self.lat,
                                                                :longitude => self.lon))

      map.get_map
    end

    def self.active_buses
      buses = []
      curl = ::Curl::Easy.perform(HrtBus::Config.buses_uri) do |c|
        c.follow_location = true
      end

      unless curl.response_code == 226
        raise curl.response_code
      end

      parsed = ::CSV.new(curl.body_str, { :headers => true })

      parsed.each do |row|
        time, date, id, lat_lon, valid, route_id  = row[0],
                                                    row[1],
                                                    row[2],
                                                    row[3],
                                                    row[4],
                                                    row[7]

        time = HrtBus::Parse.time([time, date].join(""))
        lat, lon = HrtBus::Parse.geo(lat_lon)

        if valid == "V"
          buses << new(:id => id, :time => time, :route_id => route_id, :lat => lat, :lon => lon)
        end
      end
      buses
    end

  end

end

