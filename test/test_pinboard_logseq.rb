# frozen_string_literal: true

require "test_helper"
require "sorbet-runtime"
require "pinboard_logseq"
require "pinboard_logseq/pin"
require "json"

class TestPinboardLogseq < Minitest::Test
  def test_pin
    example = <<~EOS
      {
        "href":"https://example.com/",
        "description":"Example description",
        "extended":"<blockquote>extended description</blockquote>",
        "meta":"f50dc49c08e160225c102ac1d23fb30e",
        "hash":"98fc80d72a7cc8f6a0c019a5771a360e",
        "time":"2018-01-01T22:25:30Z",
        "shared":"no",
        "toread":"no",
        "tags":"flights search"
      }
    EOS
    pin = PinboardLogseq::Pin.from_hash(JSON.parse(example))
    assert_equal "https://example.com/", pin.href
    assert_equal ["flights", "search"], pin.tags
    assert_equal "extended description", pin.extended
  end
end
