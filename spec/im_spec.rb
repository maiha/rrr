require File.dirname(__FILE__) + '/spec_helper'

describe "RRR" do
  describe "im" do
    before do
      Object.send(:remove_const, 'Foo') rescue nil
      class Foo
        im {
          bar      {'bar'}

          foo(1)   {'foo1'}
          foo('x') {'foox'}
        }
      end
    end

    context "when no arged method is defined" do
      it "adds class methods" do
        Foo.new.should respond_to(:bar)
      end

      it "allows empty args" do
        Foo.new.bar.should == 'bar'
      end

      it "ignores args" do
        Foo.new.bar(1).should == 'bar'
      end
    end

    context "when only immediate integer or string is defined" do
      it "adds class methods" do
        Foo.new.should respond_to(:foo)
      end

      it "should raise an error against empty args" do
        lambda {
          Foo.new.foo
        }.should raise_error(RR::Errors::DoubleNotFoundError)
      end

      it "allows method overload for immediate integer" do
        Foo.new.foo(1).should == 'foo1'
      end

      it "allows method overload for immediate string" do
        Foo.new.foo('x').should == 'foox'
      end

      it "raise an error against symbol" do
        lambda {
          Foo.new.foo(:x)
        }.should raise_error(RR::Errors::DoubleNotFoundError)
      end
    end
  end
end
