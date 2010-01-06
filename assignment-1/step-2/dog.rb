class Dog
  MSGS = {
    :dance => 'is dancing',
    :poo => 'is a smelly doggy!',
    :laugh => 'finds this hilarious!'
  }

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def can(*args, &block)
    meta = class << self; self; end
    meta.class_eval do
      args.each do |arg|
        if block
          send(:define_method, arg, &block)
        else
          send(:define_method, arg) { "#{@name} #{MSGS[arg]}" }
        end
      end
    end
  end

  def method_missing(sym)
    "#{@name} doesn't understand #{sym}"
  end
end
