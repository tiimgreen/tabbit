# Tabbit [![Build Status](http://img.shields.io/travis/tiimgreen/tabbit.svg)](https://travis-ci.org/tiimgreen/tabbit) [![Gem Version](http://img.shields.io/gem/v/tabbit.svg)](https://rubygems.org/gems/tabbit)

Write flexible, customisable tables in the console.

## Installation
To install Tabbit via RubyGems:

```bash
$ gem install tabbit
```

Or add this line to your application's Gemfile:

```ruby
gem 'tabbit'
```

And then execute:

```bash
$ bundle
```

## Usage
To make a new Table initialise Tabbit, passing in the Headers as the params:

```ruby
table = Tabbit.new('Name', 'Email', 'Phone No.')
```

To add an entry:

```ruby
table.add_row('Tim Green', 'tiimgreen@gmail.com', '123-456-789')
```

To print the table:

```ruby
puts table.to_s
```

```ruby
require 'tabbit'

table = Tabbit.new('Name', 'Email', 'Phone No.')

10.times do |n|
  table.add_row("Tim Green #{n}", "tiimgreen#{n}@gmail.com", "123-456-789")
end

puts table.to_s
```

![Result](http://i.imgur.com/TlsXJ0g.png)

## Contributing
1. Fork it (http://github.com/tiimgreen/tabbit/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
