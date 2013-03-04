# Url Incrementer

I'm writing a web scraper that accesses sites with different URL formats, so I pulled the logic out into a gem.  The subsitutions are made using ruby's string format operator `%` so that it doesn't depend on an external template engine.

## Installation

Add this line to your application's Gemfile:

    gem 'url_incrementer'

And then execute:

    $ bundle

Or install it yourself:

    $ gem install url_incrementer

## Usage

Set up the incrementer and call `next` to get the next URL:

```ruby
template = "http://www.example.com/searchresults?rows=%{page_size}&start=%{offset}"
type = :offset
options = { page_size: 50, offset: 0 }

ui = UrlIncrementer::Inc.new(template, type, options)
ui.next # "http://www.example.com/searchresults?rows=50&start=0"
ui.next # "http://www.example.com/searchresults?rows=50&start=50"
ui.next # "http://www.example.com/searchresults?rows=50&start=100"
```

## To Add

- [ ] Ability to inject dates in the URL

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
