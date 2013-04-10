Nido
====

Structured keys helper.

Description
-----------

If you are familiar with databases like [Redis](http://code.google.com/p/redis)
and libraries like [Ohm](http://ohm.keyvalue.org) you already know how
important it is to craft the keys that will hold the data.

    >> redis = Redis.new
    >> redis.sadd("event:3:attendees", "Albert")
    >> redis.smembers("event:3:attendees")
    => ["Albert"]

It is a design pattern in key-value databases to use the key to simulate
structure, and you can read more about this in the [case study for a
Twitter clone](http://code.google.com/p/redis/wiki/TwitterAlikeExample).

Nido helps you generate those keys by providing chainable namespaces:

    >> r = Redis.new
    >> event = Nido.new("event")
    >> r.sadd(event[3][:attendees], "Albert")
    >> r.smembers(event[3][:attendees])
    => ["Albert"]

Usage
-----

To create a new namespace:

    >> ns = Nido.new("foo")
    => "foo"

    >> ns["bar"]
    => "foo:bar"

    >> ns["bar"]["baz"]["qux"]
    => "foo:bar:baz:qux"

And you can use any object as a key, not only strings:

    >> ns[:bar][42]
    => "foo:bar:42"

In a more realistic tone, lets assume you are working with Redis and
dealing with events:

    >> events = Nido.new("events")
    => "events"

    >> id = r.incr(events[:id])
    => 1

    >> r.sadd(events[id][:attendees], "Albert")
    => "OK"

    >> meetup = events[id]
    => "events:1"

    >> r.smembers(meetup[:attendees])
    => ["Albert"]

Installation
------------

    $ gem install nido
