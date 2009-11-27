
require 'rubygems'
require 'rr'
require 'blankslate'

module RRR
  extend RR::Adapters::RRMethods
end

class << Object
  def cm(&block)
    RRR.stub(self).__send__(:instance_eval, &block)
  end

  def im(&block)
    RRR.stub.instance_of(self).__send__(:instance_eval, &block)
  end
end
