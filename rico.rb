require 'rubygems'
require 'backports'

#require_relative 'FILENAMEHERE.rb'
#that's what you use to include needed files
require_relative 'rarff-hotpatch.rb'

def lookup (value, attr_num, attribute_values)
  attribute_values[attr_num].index(value)
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

def minimal (set_of_attr, coverings)
  !coverings.any? {|cover|
    set_of_attr.all?{|attr|
      cover.include?(attr)
    }
  }
end

def partition (attrs, attribute_values)
  parts = Array.new
  case attrs.length
    when 1
      part = Array.new(attribute_values[attrs[0]].length, Array.new)
      (0...rel.instances.length).each do|i|
        part[lookup(rel.instance[i][attrs[0]], attrs[0], attribute_values)].push(i) # Find the value of the attribute for this instance and add it to the spot in partition
      end
      partition.each{|part|
        unless part.empty?
          parts.add(part)
        end
      }
    when 2
      part = Array.new(attribute_values[attrs[0]].length, Array.new(attribute_values[attrs[1]].length, Array.new()))
      (0...rel.instance.length).each do |i|
        part[lookup(rel.instance[i][attrs[0]], attrs[0], attribute_values)][lookup(rel.instance[i][attrs[1]], attrs[1], attribute_values)].push(i) # Find the value of the attribute for this instance and add it to the spot in partition
      end
      part.each{|part0|
        part0.each {|part1|
          unless part1.empty?
            parts.add(part1)
          end
        }
      }
  ### Repeat when 2 for all sizes up to max_subset_size
    else

  end
  return parts
end

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
	puts("Succesfully loaded the given dataset")
  puts("Please enter the number of decision attributes used in this project")
	### Ask for decision attributes
  puts("Please enter the attribute number for the decision attributes")
	### If they are in range then add them d_attributes
	d_attributes = Array.new( [1, 2, 4])### The set of decision attribute indexes (ints)
	### Ask for max_covering_size
  max_partition_size = 7
	### Ask for Min coverage for rules
	attribute_values = Array.new ### Make this# An array that holds the nominal values for each attribute in a subarray
	da_partition = partition(d_attributes, attribute_values) # The partition of the decision attributes
	nd_attributes = attributes.remove(da_partition)# The set of non decision attribute indexes (ints)
	coverings = Array.new # Array of a sets that make coverings
	
	# Check the partition of each non-decision attribute
	nd_attributes.each {|attribute|
		if proper_subset(da_partition, partition(attribute, attribute_values))
			set = Array.new(attribute)
			coverings.push(set) # add the list containing the attribute to coverings
			nd_attributes.remove(attribute) # remove the attribute from nDAttribute
		end
	}

	# Make all subsets that contain more than 1 attribute
	(2..max_partition_size).each do|i|
		new_sets = nd_attributes.combination(i)
    new_sets.each{|set|
      if minimal(set, attribute_values)
        if proper_subset(attribute_values, partition(set, attribute_values))
          coverings.push(set)
        end
      end
    }
  end
  # Coverings if done and complete at this point
  ### Begin creating rules from this
  ### Print rules and other things

  # End of Program
end

