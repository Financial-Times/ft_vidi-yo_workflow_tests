require 'test/unit'
require_relative '../lib/pages/mio_page'
require_relative 'test_helper'

class MioTest < Test::Unit::TestCase

  def random_string(length)
    string = ''
      length.times{string = string + ('a'..'z').to_a.sample}
    string
  end

end
