
require 'rubygems'
require 'rr'
require 'blankslate'

module RRR
  extend RR::Adapters::RRMethods

  class Proxy < BlankSlate
    def initialize(klass)
      @klass = klass
    end
  end

  class ClassProxy < Proxy
    private
      def method_missing(*args, &block)
        RRR.stub(@klass).__send__(*args, &block)
      end
  end

  class InstanceProxy < Proxy
    private
      def method_missing(*args, &block)
        RRR.mock.instance_of(@klass).__send__(*args, &block)
      end
  end

  def self.included(klass)
    klass.class_eval do
      include RR::Adapters::RRMethods
      klass.extend ClassMethods
    end
  end

  module ClassMethods
    def cm(&block)
      ClassProxy.new(self).__send__(:instance_eval, &block)
    end

    def im(&block)
      InstanceProxy.new(self).__send__(:instance_eval, &block)
    end
  end
end

class Object
  include RRR
end

