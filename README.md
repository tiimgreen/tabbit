# Tabbit [![Build Status](http://img.shields.io/travis/tiimgreen/tabbit.svg)](https://travis-ci.org/tiimgreen/tabbit) [![Gem Version](http://img.shields.io/gem/v/tabbit.svg)](https://rubygems.org/gems/tabbit)

Write felxible, customisable tables in the console.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tabbit'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install tabbit
```

## Usage

To make a new Table intialize Tabbit, passing in the Headers as the params:

```ruby
table = Tabbit.new('Name', 'Email', 'Phone No.')
```

To add a column:

```ruby
table.add_line('Tim Green', 'tiimgreen@gmail.com', '123-456-7890')
```

To print the table:

```ruby
puts table.to_s
```

```
========================================================
|  Name       |  Address              |  Number        |
========================================================
|  Tim Green  |  tiimgreen@gmail.com  |  123-456-7890  |
========================================================
```

```ruby
table.add_line('Bob Smith', 'robertsmithson@this-is-a-long-email.com', '123-456-7890')
```

```
============================================================================
|  Name       |  Address                                  |  Number        |
============================================================================
|  Tim Green  |  tiimgreen@gmail.com                      |  123-456-7890  |
|  Bob Smith  |  robertsmithson@this-is-a-long-email.com  |  123-456-7890  |
============================================================================
```

## Contributing

1. Fork it (http://github.com/tiimgreen/tabbit/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
