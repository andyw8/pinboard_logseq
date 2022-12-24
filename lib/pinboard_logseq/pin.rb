# typed: true

require "date"

module PinboardLogseq
  class Pin < T::Struct
    include T::Sig

    const :href, String
    const :description, T.any(String, FalseClass)
    const :extended, String
    const :meta, String
    const :pinboard_hash, String
    const :time, Date
    const :shared, T::Boolean
    const :to_read, T::Boolean
    const :tags, T::Array[String]

    def self.from_hash(json)
      new(
        href: json["href"],
        description: json["description"],
        extended: PinboardLogseq.clean_blockquote(json["extended"]),
        meta: json["meta"],
        pinboard_hash: json["hash"],
        time: Date.iso8601(json["time"]),
        shared: PinboardLogseq.str_to_bool(json["shared"]),
        to_read: PinboardLogseq.str_to_bool(json["toread"]),
        tags: json["tags"].split(" ")
      )
    end
  end

  def self.str_to_bool(str)
    if str == "yes"
      true
    elsif str == "no"
      false
    end
  end

  def self.clean_blockquote(str)
    str.gsub("<blockquote>", "").gsub("</blockquote>", "")
  end
end
