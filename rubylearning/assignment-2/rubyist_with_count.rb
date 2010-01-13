require 'rubyist'
require 'aliasing'

class Rubyist
  extend RubyLearning::Module

  def say_with_count!
    @count += 1
    puts "#{@name}(#{@count}) starts greeting..."
    say_without_count!
    puts "#{@name}(#{@count}) finished greeting..."
  end
  
  alias_method_chain :say!, :count do |aliased_target, punctuation|
    puts '***called alias_method_chain***'
    puts "aliased_target is: #{aliased_target}"
    puts "punctuation is: #{punctuation}"
  end
end
