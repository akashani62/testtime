require 'rubygems'
require 'irb/completion'
require "awesome_print"
AwesomePrint.irb!


IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 1000



class Object
  def interesting_methods
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end
end

puts "\n\n\n\n\nLoaded irbrc from home\n===================\n\n\n"