# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require_relative '../lib/decipher/reader'
require_relative '../lib/decipher/core'

class TestCore < Test::Unit::TestCase
 
  def test_emptyfile
    words = [] 
    lines = Decipher::Core.decode(words)
    assert_equal(0, lines.length, "Unexpected result with empty file")
  end
end
