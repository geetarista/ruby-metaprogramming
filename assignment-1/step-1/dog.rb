class Dog
  MSGS = {
    :dance => 'is dancing',
    :poo => 'is a smelly doggy!',
    :laugh => 'finds this hilarious!'
  }

  def initialize(name)
    @name = name
  end

  def can(*args, &block)
    meta = class << self; self; end
    meta.class_eval do
      args.each do |arg|
        define_method(arg) { "#{@name} #{MSGS[arg]}" }
      end
    end
  end

  def method_missing(sym)
    "#{@name} doesn't understand #{sym}"
  end
end
