require 'rubygems'
require 'backports'

#require_relative 'FILENAMEHERE.rb'
#that's what you use to include needed files
require_relative 'rarff-hotpatch.rb'


if $0 == __FILE__  # TYPE OUT A FILE NAME DUMBASS - that's for me.. because I'm smart :P
	if ARGV[0] # If an argument is provided read the given file
		arff_file = ARGV[0]
		contents = File.open(arff_file).read

		rel = Rarff::Relation.new
		rel.parse(contents)
	else # Otherwise exit and demand a filename
		puts "Please specify a filename"
		exit
	end

	rel.attributes.each do |attr|
		puts attr
	end
	
	attributes = (0...rel.attributes.length) # The array of all attribute indexes, an array of ints
	### Ask for decision attributes
	### If they are in range then add them d_attributes
	d_attributes = ### The set of decision attribute indexes (ints)
	### Max covering size
  max_partition_size = 7
	### Min coverage for rules
	attribute_values = ### Make this# An array that holds the nominal values for each attribute in a subarray
	da_partition = partition(d_attributes) # The partition of the decision attributes
	nd_attributes = attributes.remove_instance_variable(da_partition)# The set of non decision attribute indexes (ints)
	coverings = Array.new # Array of a sets that cover the
	
	# Check the partition of each non-decision attribute
	nd_attributes.each {|attribute|
		if proper_subset(da_partition, partition(attribute))
			set = Array.new(attribute)
			coverings.add(set) # add the list containing the attribute to coverings
			nd_attributes.remove(attribute) # remove the attribute from nDAttribute
		end
	}

	
	# Make all subsets that contain more than 1 attribute
	(2..max_partition_size).each do|i|
		new_sets = nd_attributes.combination(i)
		coverings += new_sets
	end

	def lookup (value, attr_num)
		attributeValues[attr_num].index(value)
	end
	
	def proper_subset (partition_da, partition_other)
		partition_other.all?{|part_o|
			partition_da.any?{|part_da|
				part_o.all?{|element|
					part_da.include?(element)
				}
			}# checks to see if all elements of each of other's partition is included in a partition of the DA
		}
	end
	
	def minimal (set_of_attr)
		!coverings.any? {|cover|
			set_of_attr.all?{|attr|
				cover.include?(attr)
			}
		}
	end

		# Coverings if done and complete at this point
	# Begin creating rules from this
	# Print rules and other things
	def partition (attrs)
		parts = Array.new
		case attrs.length
			when 1
				partition = Array.new(attributeValues[attrs[0]].length, Array.new)
				(0...rel.instances.length).each|i|
					partition[lookup(rel.instance[i][attrs[0]])].add(i) # Find the value of the attribute for this instance and add it to the spot in partition
				end
				partition.each{|part|
					#if( !part.empty? )
					unless part.empty? 
						attrs.add(part)
					end
				}
			when 2
				partition = Array.new(attributeValues[attrs[0]].length, Array.new(attributeValues[attrs[1]].length, Array.new()))
				for(i = 0; i < rel.instances.length; i++ )
					partition[lookup(rel.instance[i][attrs[0]])][lookup(rel.instance[i][attrs[1]])].add(i) # Find the value of the attribute for this instance and add it to the spot in partition
				end
				partition.each{|part0|
					part0.each {|part1|
						#if( !part1.empty? )
						unless part1.empty?
							attrs.add(part1)
						end
					}
				}
			when 3
				
			when 4
				
			when 5
				
			when 6
				
			else
				
		end
	end

end

