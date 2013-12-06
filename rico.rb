require 'rubygems'
require 'backports/1.9.1/kernel/require_relative'
require 'backports/1.9.1/enumerable/each_with_object'
require 'backports/1.9.2/enumerable/flat_map'

#require_relative 'FILENAMEHERE.rb'
#that's what you use to include needed files
require_relative 'rarff-hotpatch.rb'

# Make all subsets of 1 attribute
# 	Takes a list of non decision attributes (a list of integers) and the list of coverings (a list of list of integers)
#	For each non-decision attribute find it's partition
#	Check if it's partition is a proper covering of the decision attribute (check if proper subset, it is already minimal)
#		If it is add a list containing the single element to the list coverings
#		Also remove it from the non-decision attributes list.

# Make all subsets that contain more than 1 attribute
# For n = 2 -> maxNumAttrInACovering
	# Make a list of all combinations of size n and call this possible_subsets
	# For each subset in possible_subsets
		# For each part in coverings
			# If any part is contained in subset
				# Skip out of loop to next subset in possible_subsets, this set of attributes is not minimal
			# Else
				# If this subset is a proper subset of daPart
					# add subset to coverings

# Partitioning Algorithms
#	Takes a list of attribute numbers attrs
#	Returns a list of lists such that each sublist is a partition of the attributes
#	Uses the data table (dataTable) and the array that holds the attribute values (attrVals)

# Let n = size(attrs)
# Make n


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
	# now TO-DO
	# => Add item to correct spot in parts
	# => Make the final array to be returned
	# => for each element of chunks
	# => => If non empty the partion will be returned and appended to 'partitions'
	# => return the partions

	def proper_subset (part_da, chunks) 
		return chunks.all?{|part|

	  		part_da.any?{|dec_attr|
				part.all?{|attr_next| 
					dec_attr.include?(attr_next)
				}
			}# checks to see if all things in chunks is in part_da
		}
	end
	
		#sub_partition part = Array.new
		#included is true if the ith partition of part is comtained in part_da

		#if not included sub_partition part_da
		#	return nil #Exit if not included
	#return t #true if the loop completed


	#Partition included?
		# called from subset
		# takes an element of partition and a full partition
		# returns true if element is found in partion

end

