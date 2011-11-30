# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require_relative '../lib/coverage/reader'
require_relative '../lib/coverage/runner'

class TestReader < Test::Unit::TestCase
 
  def test_nonexistinginput
    assert_raise(IOError) {
      Coverage::Reader.read("/cesta/nikam/file.txt")
    }
  end

  def test_noinput
    assert_raise(ArgumentError) {
      Coverage::Reader.read("")
    }
  end
  
  def test_invalidinput
     assert_raise(ArgumentError) {
      Coverage::Reader.read("../lib/inputFiles/foofile.txt")
    }
  end
end
