# pinboard_logseq

This gem consumes a JSON export from Pinboard, and generates a set of Markdown files suitable for Logseq.

It generates separate Markdown files corresponding to each month in your Pinboard data. The files are saved to the `output/` directory.

Each Pinboard tag is converted to a Logseq `[[reference]]`, and is linked to the the corresponding date page, e.g. `[[Dec 1st, 2022]]`.

Once generated, you can import the files into Logseq by copying or moving them into your Logseq graph's `pages/` directory.

If you have a large number of bookmarks, you may want to do this in stages, since it can cause Logseq to become
unresponsive.

## Installation

Install the gem by executing:

    $ gem install pinboard_logseq

## Usage

Pass the path to your JSON export as `IMPORT_FILE`, e.g.

```
IMPORT_FILE="/Users/me/Desktop/pinboard_export.2022.12.18_23.19.json" pinboard_logseq
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andyw8/pinboard_logseq.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
