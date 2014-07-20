iOS Devices Manager
=======

<a href="http://badge.fury.io/rb/ios_devices_manager"><img src="https://badge.fury.io/rb/ios_devices_manager@2x.png" alt="Gem Version" height="18"></a>
[![Build Status](https://travis-ci.org/thomasstephane/ios_devices_manager.svg?branch=master)](https://travis-ci.org/thomasstephane/ios_devices_manager)

This package contains iOS Devices Manager, a library for getting your iOS devices location and send them massages and sound notifications.

## Installation ##

### Manually from RubyGems.org ###

```sh
% gem install ios_devices_manager
```

### Or if you are using Bundler or Rails ###

```ruby
# Gemfile
gem 'ios_devices_manager'
```

### Building your own gems ###

```sh
% rake build
% sudo gem install pkg/ios_devices_manager-x.y.z.gem
```

## Usage ##

If you are working in Ruby only, require the gem

```ruby
require 'ios_devices_manager'
```

To start, load a new manager
```ruby
my_manager = IOSDevices::Manager.new(username, password)
```

To view your devices, call:

```ruby
my_manager.devices
```

To send a message, use the following
```ruby
my_device = my_manager.devices.first
my_manager.send(my_device, "Title test", "Message content test")
```
You can pass ```true``` as a fourth param to trigger a sound with the message

To send a sound, use the following
```ruby
my_device = my_manager.devices.first
my_manager.play_sound(my_device, "Optional text with sound")
```

## Latest changes ##

Take a look at the
[CHANGELOG](https://github.com/thomasstephane/ios_devices_manager/blob/master/CHANGELOG.md) for details about recent changes to the current version.


## Questions? ##

Feel free to

* [create an issue on GitHub](http://github.com/thomasstephane/ios_devices_manager/issues)
* [ask a question on StackOverflow](http://stackoverflow.com) (tag with `ios_devices_manager`)
* send me a tweet [@thomasstephn](http://twitter.com/thomasstephn)

## Maintainer ##

* [Stephane Thomas](https://github.com/thomasstephane) (2014, original author)
