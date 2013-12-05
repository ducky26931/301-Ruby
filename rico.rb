require 'rubygems'
require 'backports/1.9.1/kernel/require_relative'
require 'backports/1.9.1/enumerable/each_with_object'
require 'backports/1.9.2/enumerable/flat_map'

#require_relative 'FILENAMEHERE.rb'
#that's what you use to include needed files
require_relative 'rarff-hotpatch.rb'

# Partitioning Algorithms
#	Takes a list of attribute numbers
#	Returns a list of partitions
#	uses *table* and *Attributes-Values*


# Partition of size one
class Array
	def chunks(size)
	#return array of arrays
	end
end

 
# partition1_attribute([1,2,3])

if $0 == __FILE__  # TYPE OUT A FILE NAME DUMBASS - that's for me.. because I'm smart :P
	if ARGV[0]
		arff_file = ARGV[0]
		contents = File.open(arff_file).read

		rel = Rarff::Relation.new
		rel.parse(contents)
	else
		puts "Please specify a filename"
		exit
	end

	rel.attributes.each do |attr|
		puts attr
	end
	
	chunks = rel.attributes.each_slice(1).to_a # we now have chunks of things

	# need to now add empty array onto arrays
	things = Array.new # => []
	chunks.each {|chunk| chunk.push(things)}
	p chunks

end
