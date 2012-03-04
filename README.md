# hrt_bus

Ruby gem for public HRT bus location data

## Installation

    gem install hrt_bus

## Examples

### HRT bus for a specific route as Ruby ActiveModel object

    HrtBus::Rider.new(:route_id => "15", :direction => "inbound").bus

    #<HrtBus::Bus:0x10151b380
        attr_accessor :id = "2020",
        attr_accessor :lat = "36.9161257",
        attr_accessor :lon = "-76.3075035",
        attr_accessor :route_id = "15",
        attr_accessor :time = Sat, 03 Mar 2012 21:15:34 +0000,
    >

### Generate a static Google Map for a bus

    HrtBus::Rider.new(:route_id => "15", :direction => "outbound").bus.static_map

![map](http://github.com/bds/hrt_bus/raw/master/examples/map.png)

### A collection of active HRT buses

    ruby-1.9.2-p180 :001 > HrtBus::Bus.active_buses

    [
        [ 0] #<HrtBus::Bus:0x10290a5f8
            attr_accessor :id = "1810",
            attr_accessor :lat = "36.8596125",
            attr_accessor :lon = "-76.2845262",
            attr_accessor :route_id = "6",
            attr_accessor :time = Sat, 03 Mar 2012 21:15:10 +0000,
        >,
        [ 1] #<HrtBus::Bus:0x10138af48
            attr_accessor :id = "2020",
            attr_accessor :lat = "36.9161257",
            attr_accessor :lon = "-76.3075035",
            attr_accessor :route_id = "15",
            attr_accessor :time = Sat, 03 Mar 2012 21:15:34 +0000,
        >,

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
