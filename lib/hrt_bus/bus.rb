module HrtBus
  class Bus
    include ActiveModel::Validations
    include ActiveModel::Serializers::JSON

    ATTRIBUTES = [ :id, :time, :direction, :lat, :lon, :route_id ]

    DIRECTIONS = { "1" => "inbound",
                   "2" => "outbound" }.freeze

    attr_accessor *ATTRIBUTES

    validates_numericality_of :route_id, greater_than: 0
    validates_numericality_of :lat, greater_than: 0
    validates_numericality_of :lon, less_than: 0
    validates :direction, :inclusion => { :in => DIRECTIONS.values }

    validates :id, :time, :direction, :lat, :lon, :route_id, :presence => true

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
        c.timeout = HrtBus::Config.timeout
      end

      unless curl.response_code == 226
        raise curl.response_code
      end

      parsed = ::CSV.new(curl.body_str, { :headers => true, :skip_blanks => true })

      parsed.each do |row|
        time, date, id, lat_lon, valid, route_id, direction  = row[0],
                                                               row[1],
                                                               row[2],
                                                               row[3],
                                                               row[4],
                                                               row[7],
                                                               DIRECTIONS[row[8]]

        time     = HrtBus::Parse.time(time, date)
        lat, lon = HrtBus::Parse.geo(lat_lon)

        bus = new(:id => id, :time => time, :direction => direction, :route_id => route_id, :lat => lat, :lon => lon)

        buses << bus if bus.valid?
      end
      buses
    end

    def self.all
      buses = []
      curl = ::Curl::Easy.perform(HrtBus::Config.buses_uri) do |c|
        c.timeout = HrtBus::Config.timeout
      end

      unless curl.response_code == 226
        raise curl.response_code
      end

      parsed = ::CSV.new(curl.body_str, { :headers => true, :skip_blanks => true })

      parsed.each do |row|
        time, date, id, lat_lon, valid, route_id, direction  = row[0],
                                                               row[1],
                                                               row[2],
                                                               row[3],
                                                               row[4],
                                                               row[7],
                                                               DIRECTIONS[row[8]]

        time     = HrtBus::Parse.time(time, date)
        lat, lon = HrtBus::Parse.geo(lat_lon)

        buses << new(:id => id, :time => time, :direction => direction, :route_id => route_id, :lat => lat, :lon => lon)
      end
      buses
    end

  end

end

