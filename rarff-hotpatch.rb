require 'rarff'

# check to see if you can call join on it 
# if not don't.. simple yes?
# hotpatch compliments of Nathan and Max 
class Rarff::Attribute
	def to_arff
		if @type_is_nominal && @type.respond_to?("join")
			Rarff::ATTRIBUTE_MARKER + " #{@name} #{@type.to_a.join(',')}"
		else
			Rarff::ATTRIBUTE_MARKER + " #{@name} #{@type}"
		end
	end
end