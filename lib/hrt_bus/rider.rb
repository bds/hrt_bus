module HrtBus
  class Rider
    include ActiveModel::Validations
    include ActiveModel::Serializers::JSON

    ATTRIBUTES = [ :id, :time, :lat, :lon, :route_id ]

    attr_accessor *ATTRIBUTES

    validates_numericality_of :route_id, greater_than: 0
    validates_numericality_of :lat, greater_than: 0, :if => :lat
    validates_numericality_of :lon, less_than: 0,    :if => :lon

    validates :route_id, :presence => true

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

    def buses
      HrtBus::Bus.active_buses.select { |bus| bus.route_id == self.route_id }
    end

  end

end

