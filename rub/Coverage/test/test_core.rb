# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require_relative '../lib/coverage/case'
require_relative '../lib/coverage/segment'
require_relative '../lib/coverage/reader'
require_relative '../lib/coverage/core'


class TestCore < Test::Unit::TestCase
 
  def test_nosolution
    
    cases = Coverage::Reader.read('../lib/inputFiles/test_nosolution.txt')
    segments = Coverage::Core.coverLine(cases.pop,true)
    assert_equal(0, segments.length, "Bad result: expected <0> but <"+segments.length.to_s+"> was found")
  end
  
  def test_singlesolution
    
    cases = Coverage::Reader.read('../lib/inputFiles/test_singlesolution.txt')
    segments = Coverage::Core.coverLine(cases.pop,true)
    assert_equal(1, segments.length, "Bad result: expected <1> but <"+segments.length.to_s+"> was found")
  end
  
end
