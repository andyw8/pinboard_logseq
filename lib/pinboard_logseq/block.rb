# typed: true

module PinboardLogseq
  class Block
    def self.from_pin(pin)
      year = pin.time.strftime("%Y")
      month_name_short = pin.time.strftime("%b")
      day = pin.time.day.ordinalize
      formatted_date = "#{month_name_short} #{day}, #{year}"
      content = "- 🔖 [#{pin.description || "No description"}](#{pin.href}) [[#{formatted_date}]] "
      tag_bits = pin.tags.map { |t| "[[#{t}]]" }
      tag_bits << "[[Pinboard - To Read]]" if pin.to_read
      content += tag_bits.join(" ")
      if pin.extended && pin.extended != "" && pin.extended != "undefined"
        content += "\n> #{pin.extended}\n\n"
      end
      content
    end
  end
end
