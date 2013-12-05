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
def partition1_attribute(attributes) # array containing attribute
	parts = attributes.map { |a| [] } 	# table of attribute value combinations
	p parts
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

	rel.instances.each do |inst|
		puts inst
	end
end
