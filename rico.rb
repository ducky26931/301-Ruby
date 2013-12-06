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
	### If they are in range then add them dAttributes
	dAttributes = ### The set of decision attribute indexes (ints)
	### Max covering size
	### Min coverage for rules
	attributeValues = ### Make this# An array that holds the nominal values for each attribute in a subarray
	dAPartition = partition(dAttributes) # The partition of the decision attributes
	nDAttributes = attributes.remove(dAPartition)# The set of non decision attribute indexes (ints)
	coverings = Array.new() # Array of a sets that cover the 
	
	# Check the partition of each non-decision attribute
	nDAttributes.each {|attribute|
		if properSubset(dAPartition, partition(attribute))
			set = Array.new(attibute)
			coverings.add(set) # add the list containing the attribute to coverings
			nDAttributes.remove(attribute) # remove the attribute from nDAttribute
		end
	}

	
	# Make all subsets that contain more than 1 attribute
	(2..maxPartitionSize).each do|i|
		newSets = nDattributes.combination(i)
		coverings += newSets
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

		# Coverings if done and complete at this point
	# Begin creating rules from this
	# Print rules and other things
	def partition (attrs)
		parts = Array.new
		case attrs.length
			when 1
				partition = Array.new(attributeValues[attrs[0]].length, Array.new)
				#for( int i = 0; i < rel.instances.length; i++ )
				#	partition[lookup(rel.instance[i][attrs[0]])].add(i) # Find the value of the attribute for this instance and add it to the spot in partition
				(0...rel.instances.length).each do|i|
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
				#for( int i = 0; i < rel.instances.length; i++ )
				#	partition[lookup(rel.instance[i][attrs[0]])][lookup(rel.instance[i][attrs[1]])].add(i) # Find the value of the attribute for this instance and add it to the spot in partition
				(0...rel.instance.length).each do |i|
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
				
			when 7
				
		end
	end

end

