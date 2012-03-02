# hrt_bus

Ruby gem for public HRT bus location data

### Installation

    gem intall hrt_bus

### A collection of HRT buses as Ruby ActiveModel objects

    ruby-1.9.2-p180 :001 > HrtBus::Bus.active_buses

    [
        [0] #<HrtBus::Bus:0x101841ac8
            attr_accessor :id = "4020",
            attr_accessor :lat = "36.8088548",
            attr_accessor :lon = "-76.3534049",
            attr_accessor :route_id = "105",
            attr_accessor :time = #<DateTime:0x101876408
            >
        >,
        [1] #<HrtBus::Bus:0x100a44c68
            attr_accessor :id = "1233",
            attr_accessor :lat = "36.9181620",
            attr_accessor :lon = "-76.1926839",
            attr_accessor :route_id = "8",
            attr_accessor :time = #<DateTime:0x100a44e20
            >
        >
    ]
    ...
     
### A collection of HRT buses as JSON

    ruby-1.9.2-p180 :001 > HrtBus::Bus.active_buses.to_json

    [
       {
          "bus":{
             "id":"4020",
             "lat":"36.8088548",
             "lon":"-76.3534049",
             "route_id":"105",
             "time":"2012-03-02T13:34:16+00:00"
          }
       },
       {
          "bus":{
             "id":"1233",
             "lat":"36.9181620",
             "lon":"-76.1926839",
             "route_id":"8",
             "time":"2012-03-02T13:34:16+00:00"
          }
       }
    ]
    ...

### Buses from a specific route

    HrtBus::Bus.active_buses.select { |bus| bus.route_id == "105" }

### Generate a static Google Map for a bus

    HrtBus::Bus.active_buses.select { |bus| bus.route_id == "105" }.first.static_map

![map](http://github.com/bds/hrt_bus/raw/master/examples/map.png)

### Determine if a bus is valid

    HrtBus::Bus.active_buses.last.valid?

## Contributing to hrt_bus
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) Brian Douglas Smith. See LICENSE.txt for
further details.
