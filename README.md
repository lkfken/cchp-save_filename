# Cchp::SaveFilename

Normalize the filename.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cchp-save_filename'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cchp-save_filename

## Usage

```ruby
require 'cchp/save_filename'
filename = Cchp::SaveFilename.new(:basename => 'basename', :member_id => '000123456*01', :directory => './save', :date => Date.parse('20160101'), :file_type => '.pdf')
puts filename
# "./save/000123456_01_20160101_basename.pdf"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cchp-save_filename. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

