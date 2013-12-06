require 'rubygems'
require 'backports/1.9.1/kernel/require_relative'
require 'backports/1.9.1/enumerable/each_with_object'
require 'backports/1.9.2/enumerable/flat_map'

#require_relative 'FILENAMEHERE.rb'
#that's what you use to include needed files
require_relative 'rarff-hotpatch.rb'


# Partition of size one
class Array
	def chunks(size)
	#return array of arrays
	end
end

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
	
	attributes = (0...rel.attributes.length) # array of attribute indexes (ints)
	attributeValues = # an array of arrays that hold the nominal values for each attribute
	dAttributes = # array of decision attribute indexes (ints)
	dAPartition = # array of shit
	# Set dAPartition for 
	nDAttributes = # array of non decision attribute indexes (ints)
	coverings = # array of 
	
	# Check the partition of each non-decision attribute
	nDAttributes.each {|attribute|
		if (properSubset( dAPartition, partition(attribute) ))
			set = Array.new(attibute)
			coverings.add(set) # add the list containing the attribute to coverings
			nDAttributes.remove(attribute) # remove the attribute from nDAttribute
		end
	}
	
	# Make all subsets that contain more than 1 attribute
	for(int i = 2; i <= maxPartitionSize; i++){
		newSets = nDAttributes.combination(i) # Find all sets of size i
		newSets.each{|set| 
			if(minimal(set)) # Make sure that the set is minimal
				if(properSubset(dAPartition, set)) # Make sure that the set is a proper subset
					coverings.add(set) # Add the set to coverings
				end
			end
		}
	}

	# Coverings if done and complete at this point
	# Begin creating rules from this
	# Print rules and other things

	def partition (attrs)
		# Make a attrs.length dimension array of arrays to hold the datatable of entries
		# instances.valueat
	end

	def partition1 (attrs)
		partition = Array.new(attrs.length)
		for( int i = 0; i < # I should probably finish this at some points
		rel.instances.each{|inst|
			partition[].add()
		}
		# instances.valueat
	end

	def lookup (value, attrNum)
		return attributeValues[attrNum].index(value)
	end
	
	def proper_subset (partitionDA, partitionOther) 
		return partitionOther.all?{|partO|
			partitionDA.any?{|partDA|
				partO.all?{|element|
					partDA.include?(element)
				}
			}# checks to see if all elements of each of other's partition is included in a partition of the DA
		}
	end
	
	def minimal (setOfAttr)
		return !coverings.any? {|cover|
			setOfAttr.all?{|attr|
				cover.include?(attr)
			}
		}
	end

end

