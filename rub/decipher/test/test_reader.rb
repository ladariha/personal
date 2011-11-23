# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require_relative '../lib/decipher/reader'
require_relative '../lib/decipher/runner'

class TestReader < Test::Unit::TestCase
 
  def test_nonexistinginput
  
    assert_raise(IOError) {
      reader =  Decipher::Reader.new("/cesta/nikam/file.txt")
    }
  end

  def test_noinput
    assert_raise(ArgumentError) {
      reader =  Decipher::Reader.new("")
    }
  end
end
