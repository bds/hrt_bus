module HrtBus

  class Parse

    def self.time(time, date)
      return if time.nil? || date.nil?

      data = [time, date].join(" ")
      DateTime.strptime(data, '%H:%M:%S %m/%d')        
    end

    def self.geo(data)
      return if data.nil?

      lat, lon = data.split("/")
      lat = lat.insert(2, ".")
      lon = lon.insert(3, ".")

      [lat, lon]
    end

  end

end

