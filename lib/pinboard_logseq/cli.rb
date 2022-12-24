require "json"
require "date"
require "active_support/core_ext/integer/inflections"

require "sorbet-runtime"
require_relative "pin"
require_relative "block"

module PinboardLogseq
  include T::Sig

  IMPORT_FILE = ENV.fetch("IMPORT_FILE")

  class Cli
    def self.execute(args)
      new(args).execute
    end

    def initialize(args)
      @args = args
    end

    def execute
      data = JSON.parse(File.read(IMPORT_FILE))

      pins = data.map { |json| Pin.from_hash(json) }

      pins_by_year_and_month = pins.group_by { |p| [p.time.year, p.time.month] }

      pins_by_year_and_month.each do |(year, month), pins|
        content = pins.map do |pin|
          Block.from_pin(pin)
        end.join("\n")
        month_name_long = pins.first.time.strftime("%B")
        File.write(
          "output/Pinboard Import ___ #{year} ___ #{month_name_long}.md",
          content
        )
      end
    end
  end
end
