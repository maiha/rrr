require File.dirname(__FILE__) + '/spec_helper'

class Foo
  cm {
    bar      {'bar'}

    foo(1)   {'foo1'}
    foo('x') {'foox'}
  }
end

describe "RRR" do
  describe "cm" do
    context "when no arged method is defined" do
      it "adds class methods" do
        Foo.should respond_to(:bar)
      end

      it "allows empty args" do
        Foo.bar.should == 'bar'
      end

      it "ignores args" do
        Foo.bar(1).should == 'bar'
      end
    end

    context "when only immediate integer or string is defined" do
      it "adds class methods" do
        Foo.should respond_to(:foo)
      end

      it "should raise an error against empty args" do
        lambda {
          Foo.foo
        }.should raise_error(RR::Errors::DoubleNotFoundError)
      end

      it "allows method overload for immediate integer" do
        Foo.foo(1).should == 'foo1'
      end

      it "allows method overload for immediate string" do
        Foo.foo('x').should == 'foox'
      end

      it "raise an error against symbol" do
        lambda {
          Foo.foo(:x)
        }.should raise_error(RR::Errors::DoubleNotFoundError)
      end
    end
  end
end
