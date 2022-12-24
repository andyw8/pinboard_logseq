require "json"
require "date"
require "active_support/core_ext/integer/inflections"

require_relative "pin"

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
        content = ""
        pins.each do |pin|
          year = pin.time.strftime("%Y")
          month_name_short = pin.time.strftime("%b")
          day = pin.time.day.ordinalize
          formatted_date = "#{month_name_short} #{day}, #{year}"
          content +=
            "- 🔖 [#{pin.description || "No description"}](#{pin.href}) [[#{formatted_date}]] "
          content += "\n> #{pin.extended}" if pin.extended && pin.extended != "" && pin.extended != "undefined"
          tag_bits = pin.tags.map { |t| "[[#{t}]]" }
          tag_bits << "[[Pinboard - To Read]]" if pin.to_read
          content += tag_bits.join(" ")
          content += "\n"
        end
        month_name_long = pins.first.time.strftime("%B")
        File.write(
          "output/Pinboard Import ___ #{year} ___ #{month_name_long}.md",
          content
        )
      end
    end
  end
end
