# to_deep_csv

to_csv for `Array<Array>`, `Array<Hash>`, `Array<ActiveRecord::Base>`, `ActiveRecord::Relation` etc.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'to_deep_csv'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install to_deep_csv

## Usage

```ruby
require "to_deep_csv"

[{a: 1, b: 2}].to_deep_csv(headers: true)
[[1, 2]].to_deep_csv
[[1, 2]].to_deep_csv(headers: true, columns: [:a, :b])
{:a => 1}.to_a.to_deep_csv

# for ActiveRecord
Foo.all.to_deep_csv(headers: true)
Foo.all.to_deep_csv(columns: [:id, :name])
Foo.all.select(:id, :name).to_deep_csv
Foo.all.group(:type).count.to_a.to_deep_csv(headers: true, columns: [:type, :count])
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Narazaka/to_deep_csv.

## License

This is released under The [Zlib License](https://narazaka.net/license/Zlib?2018)
