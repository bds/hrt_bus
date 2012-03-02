# hrt_bus

Ruby gem for public HRT bus location data

## Installation

  gem intall hrt_bus

## A collection of HRT buses as Ruby ActiveModel objects

  HrtBus::Bus.active_buses
     
## A collection of HRT buses as JSON

  HrtBus::Bus.active_buses.to_json

## Buses from a specific route

  HrtBus::Bus.active_buses.select { |bus| bus.route_id == "105" }

## Generate a static Google Map for a bus

  HrtBus::Bus.active_buses.select { |bus| bus.route_id == "105" }.first.static_map

  ![map]("examples/map.png")

## Determine if a bus is valid

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
