# hrt_bus

Ruby gem for public HRT bus location data

## Installation

    gem install hrt_bus

## Examples

### HRT bus as a Ruby ActiveModel object

    HrtBus::Rider.new(:route_id => "20", :direction => "inbound").bus

    #<HrtBus::Bus:0x1028d40c0
      attr_accessor :direction = "inbound",
      attr_accessor :id = "2021",
      attr_accessor :lat = "36.8597919",
      attr_accessor :lon = "-76.2845680",
      attr_accessor :route_id = "20",
      attr_accessor :time = Sat, 03 Mar 2012 23:24:28 +0000,
    >

### Generate a static Google Map for a bus

    HrtBus::Rider.new(:route_id => "15", :direction => "outbound").bus.static_map

![map](http://github.com/bds/hrt_bus/raw/master/examples/map.png)

### A collection of active HRT buses

    HrtBus::Bus.active_buses

    [
        [0] #<HrtBus::Bus:0x100afcac0
            attr_accessor :direction = "outbound",
            attr_accessor :id = "1909",
            attr_accessor :lat = "36.9711193",
            attr_accessor :lon = "-76.4097323",
            attr_accessor :route_id = "107",
            attr_accessor :time = Sat, 03 Mar 2012 23:25:35 +0000,
        >,
        [1] #<HrtBus::Bus:0x102956ef8
            attr_accessor :direction = "outbound",
            attr_accessor :id = "1214",
            attr_accessor :lat = "36.9881023",
            attr_accessor :lon = "-76.4242998",
            attr_accessor :route_id = "103",
            attr_accessor :time = Sat, 03 Mar 2012 23:26:02 +0000,
        >
    ]
    ...
     
### A collection of HRT buses as JSON

    HrtBus::Bus.active_buses.to_json

    [
       {
          "bus":{
             "direction":"inbound",
             "id":"1218",
             "lat":"37.0145065",
             "lon":"-76.3646452",
             "route_id":"103",
             "time":"2012-03-03T23:26:20+00:00"
          }
       },
       {
          "bus":{
             "direction":"outbound",
             "id":"2026",
             "lat":"36.8537111",
             "lon":"-76.1759363",
             "route_id":"20",
             "time":"2012-03-03T23:26:29+00:00"
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
