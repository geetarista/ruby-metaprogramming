require 'dog'
require 'spec'

describe Dog do
  context "Lassie" do
    before do
      @lassie = Dog.new("Lassie")
      @lassie.can :dance, :poo, :laugh
    end

    it "Lassie should dance" do
      @lassie.should respond_to(:dance)
      @lassie.dance.should == "Lassie is dancing"
    end

    it "Lassie should poo" do
      @lassie.should respond_to(:poo)
      @lassie.poo.should == "Lassie is a smelly doggy!"
    end

    it "Lassie should laugh" do
      @lassie.should respond_to(:laugh)
      @lassie.laugh.should == "Lassie finds this hilarious!"
    end
  end

  context "Fido" do
    before do
      @fido = Dog.new("Fido")
      @fido.can(:poo) { "#{name} is smelly." }
    end

    it "@fido should not dance" do
      @fido.should_not respond_to(:dance)
      @fido.dance.should == "Fido doesn't understand dance"
    end

    it "@fido should poo" do
      @fido.should respond_to(:poo)
      @fido.poo.should == "Fido is smelly."
    end

    it "@fido should not laugh" do
      @fido.should_not respond_to(:laugh)
      @fido.laugh.should == "Fido doesn't understand laugh"
    end
  end

  context "Stimpy" do
    before do
      @stimpy = Dog.new("Stimpy")
      @stimpy.can :dance
      @stimpy.can(:cry) { "#{name} cried AHHHH" }
    end

    it "Stimpy should not dance" do
      @stimpy.should respond_to(:dance)
      @stimpy.dance.should == "Stimpy is dancing"
    end

    it "Stimpy should poo" do
      @stimpy.should_not respond_to(:poo)
      @stimpy.poo.should == "Stimpy doesn't understand poo"
    end

    it "Stimpy should not laugh" do
      @stimpy.should_not respond_to(:laugh)
      @stimpy.laugh.should == "Stimpy doesn't understand laugh"
    end

    it "Stimpy should cry" do
      @stimpy.should respond_to(:cry)
      @stimpy.cry.should == "Stimpy cried AHHHH"
    end
  end
end
