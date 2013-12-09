require 'rubygems'
require 'backports'

# Used for easy access to ARFF files
require_relative 'rarff-hotpatch.rb'

def lookup (value, attr_num, attribute_values)
  # Looks up the offset offset of the value in the attribute_values table
	attribute_values[attr_num].index(value)
end

def proper_subset (partition_da, partition_other)
  # Checks that all subpartitions of the set O meet the next condition
	partition_other.all?{|part_o|
    # Checks if any subpartitions of the decision attribute set meets the next conditions
		partition_da.any?{|part_da|
      # Checks that each element of the subpartition of O is included in a subpartition of the decision attribute set
			part_o.all?{|element|
				part_da.include?(element)
			}
		}
	}
end

def minimal (set_of_attr, coverings)
  # Returns false if any element of coverings is completely contained in the set_of_attr
	!coverings.any? {|cover|
    cover.all?{|attr|
      set_of_attr.include?(attr)
    }
	}
end

def partition (rel, attrs, attribute_values)
  # Creates parts, the Array that holds the partitions
	parts = Array.new
  # A switch case to handle different sized sets
	case attrs.length
    when 1
      # Creates the blank array to divide up the possible values
      part = Array.new(attribute_values[attrs[0]].length){ |i| Array.new}
      # Push the instance number into the correlating array positions
		  (0...rel.instances.length).each do|i|
			  part[attribute_values[attrs[0]].index(rel.instances[i][attrs[0]])].push(i) # Find the value of the attribute for this instance and add it to the spot in partition
		end
    # Remove empty partitions from the list of partitions
		part.each{|party|
			unless party.empty?
				parts.push(party)
			end
		}
	when 2
    # Creates the blank array to divide up the possible values
    part = Array.new(attribute_values[attrs[0]].length){ |i1|
           Array.new(attribute_values[attrs[1]].length){ |i2| Array.new}}
    # Push the instance number into the correlating array positions
    (0...rel.instances.length).each do |i|
      part[attribute_values[attrs[0]].index(rel.instances[i][attrs[0]])][attribute_values[attrs[1]].index(rel.instances[i][attrs[1]])].push(i)
    end
    # Remove empty partitions and flatten the list of partitions
    part.each{|part0|
      part0.each {|part1|
        unless part1.empty?
          parts.push(part1)
        end
      }
    }
	when 3
    # Creates the blank array to divide up the possible values
    part = Array.new(attribute_values[attrs[0]].length){ |i1|
           Array.new(attribute_values[attrs[1]].length){ |i2|
           Array.new(attribute_values[attrs[2]].length){ |i3| Array.new}}}
    # Push the instance number into the correlating array positions
		(0...rel.instances.length).each do |i|
			part[attribute_values[attrs[0]].index(rel.instances[i][attrs[0]])][attribute_values[attrs[1]].index(rel.instances[i][attrs[1]])][attribute_values[attrs[2]].index(rel.instances[i][attrs[2]])].push(i)
    end
    # Remove empty partitions and flatten the list of partitions
		part.each{|part0|
			part0.each {|part1|
				part1.each{|part2|
					unless part2.empty?
						parts.push(part2)
					end
				}
			}
		}
	when 4
    # Creates the blank array to divide up the possible values
    part = Array.new(attribute_values[attrs[0]].length){ |i1|
           Array.new(attribute_values[attrs[1]].length){ |i2|
           Array.new(attribute_values[attrs[2]].length){ |i3|
           Array.new(attribute_values[attrs[3]].length){ |i4| Array.new}}}}
    # Push the instance number into the correlating array positions
		(0...rel.instances.length).each do |i|
      part[attribute_values[attrs[0]].index(rel.instances[i][attrs[0]])][attribute_values[attrs[1]].index(rel.instances[i][attrs[1]])][attribute_values[attrs[2]].index(rel.instances[i][attrs[2]])][attribute_values[attrs[3]].index(rel.instances[i][attrs[3]])].push(i)
		end
    # Remove empty partitions and flatten the list of partitions
		part.each{|part0|
			part0.each {|part1|
				part1.each{|part2|
					part2.each{|part3|
						unless part3.empty?
							parts.push(part3)
						end
					}
				}
			}
		}
	when 5
    # Creates the blank array to divide up the possible values
    part = Array.new(attribute_values[attrs[0]].length){ |i1|
           Array.new(attribute_values[attrs[1]].length){ |i2|
           Array.new(attribute_values[attrs[2]].length){ |i3|
           Array.new(attribute_values[attrs[3]].length){ |i4|
           Array.new(attribute_values[attrs[4]].length){ |i5| Array.new}}}}}
    # Push the instance number into the correlating array positions
		(0...rel.instances.length).each do |i|
      part[attribute_values[attrs[0]].index(rel.instances[i][attrs[0]])][attribute_values[attrs[1]].index(rel.instances[i][attrs[1]])][attribute_values[attrs[2]].index(rel.instances[i][attrs[2]])][attribute_values[attrs[3]].index(rel.instances[i][attrs[3]])][attribute_values[attrs[4]].index(rel.instances[i][attrs[4]])].push(i)
		end
    # Remove empty partitions and flatten the list of partitions
		part.each{|part0|
			part0.each {|part1|
				part1.each{|part2|
					part2.each{|part3|
						part3.each{|part4|
							unless part4.empty?
								parts.push(part4)
							end
						}
					}
				}
			}
		}
	when 6
    # Creates the blank array to divide up the possible values
    part = Array.new(attribute_values[attrs[0]].length){ |i1|
           Array.new(attribute_values[attrs[1]].length){ |i2|
           Array.new(attribute_values[attrs[2]].length){ |i3|
           Array.new(attribute_values[attrs[3]].length){ |i4|
           Array.new(attribute_values[attrs[4]].length){ |i5|
           Array.new(attribute_values[attrs[5]].length){ |i6| Array.new}}}}}}
    # Push the instance number into the correlating array positions
		(0...rel.instances.length).each do |i|
      part[attribute_values[attrs[0]].index(rel.instances[i][attrs[0]])][attribute_values[attrs[1]].index(rel.instances[i][attrs[1]])][attribute_values[attrs[2]].index(rel.instances[i][attrs[2]])][attribute_values[attrs[3]].index(rel.instances[i][attrs[3]])][attribute_values[attrs[4]].index(rel.instances[i][attrs[4]])][attribute_values[attrs[5]].index(rel.instances[i][attrs[5]])].push(i)
		end
    # Remove empty partitions and flatten the list of partitions
		part.each{|part0|
			part0.each {|part1|
				part1.each{|part2|
					part2.each{|part3|
						part3.each{|part4|
							part4.each{|part5|
								unless part5.empty?
									parts.push(part5)
								end
							}
						}
					}
				}
			}
		}
	else
    # Creates the blank array to divide up the possible values
    part = Array.new(attribute_values[attrs[0]].length){ |i1|
           Array.new(attribute_values[attrs[1]].length){ |i2|
           Array.new(attribute_values[attrs[2]].length){ |i3|
           Array.new(attribute_values[attrs[3]].length){ |i4|
           Array.new(attribute_values[attrs[4]].length){ |i5|
           Array.new(attribute_values[attrs[5]].length){ |i6|
           Array.new(attribute_values[attrs[6]].length){ |i7| Array.new}}}}}}}
    # Push the instance number into the correlating array positions
		(0...rel.instances.length).each do |i|
      part[attribute_values[attrs[0]].index(rel.instances[i][attrs[0]])][attribute_values[attrs[1]].index(rel.instances[i][attrs[1]])][attribute_values[attrs[2]].index(rel.instances[i][attrs[2]])][attribute_values[attrs[3]].index(rel.instances[i][attrs[3]])][attribute_values[attrs[4]].index(rel.instances[i][attrs[4]])][attribute_values[attrs[5]].index(rel.instances[i][attrs[5]])][attribute_values[attrs[6]].index(rel.instances[i][attrs[6]])].push(i)
		end
    # Remove empty partitions and flatten the list of partitions
		part.each{|part0|
			part0.each {|part1|
				part1.each{|part2|
					part2.each{|part3|
						part3.each{|part4|
							part4.each{|part5|
								part5.each{|part6|
									unless part6.empty?
										parts.push(part6)
									end
								}
							}
						}
					}
				}
			}
		}
	end
	return parts ### DON"T KNOW IF REDUNDANT
end

##### Load ARFF File #####
if $0 == __FILE__  # Type out a filename in the command line
	if ARGV[0] # If an argument is provided read the given file
		arff_file = ARGV[0]
		contents = File.open(arff_file).read
    # Create Rarff relations to access the data
		rel = Rarff::Relation.new
		rel.parse(contents)
	else # Otherwise demand a filename
		puts "Please specify a filename"
		file_name = $stdin.gets.chomp!
		contents = File.open(file_name).read
    # Create Rarff relations to access the data
		rel = Rarff::Relation.new
		rel.parse(contents)
	end

  # Print out all of the Attributes
	rel.attributes.each do |attr|
		puts attr
	end

  ##### Get User Input #####
	puts("Succesfully loaded the given dataset")
  # Ask for decision attributes
	puts "Enter the indicies of the decision attributes. Indicies start at 0. Hit enter after every attribute. When finished type 'done'"
	attr_num_da = Array.new
	input = $stdin.gets.chomp! # We should check that the input is within valid range
	while input != 'done' # Get input until 'done' is received
		attr_num_da << input.to_i
		input = $stdin.gets.chomp!
  end
	puts("Enter the maximum partition size (max of 7)") # Find the max partition size
	max_partition_size = $stdin.gets.chomp!.to_i
  puts("Enter the minimum covering size") # Find the minimum covering size
  min_covering = $stdin.gets.chomp!.to_i
	d_attributes = attr_num_da # This is the set of decision attributes (their indicies)

  ##### Create attribute value lookup table #####
  # An array for each attribute
	attribute_values = Array.new(rel.attributes.length) { |i| Array.new }
  # Add each value in the data set and add it to the appropriate attribute_values sub array
  rel.instances.each {|inst|
    (0...rel.attributes.length).each {|attr|
      attribute_values[attr].push(inst[attr])
    }
  }
  # Remove all duplicate values
  (0...rel.attributes.length).each {|i|
    attribute_values[i] = attribute_values[i].uniq
  }

  # Find the partition of the decision attributes
 	da_partition = partition(rel, d_attributes, attribute_values)
	# Create the array to hold non decision attributes
  nd_attributes = Array.new
  (0...rel.attributes.length).each {|i| nd_attributes.push(i)}
  nd_attributes -= d_attributes

  # Create the empty array to hold proper coverings
	coverings = Array.new

	# Check the partition of each non-decision attribute
	single_coverings = Array.new
  nd_attributes.each {|attribute|
		# Create a one element array to hold the attribute
    set = [attribute]
    # The set is already minimal so only proper subset will be checked
		if proper_subset(da_partition, partition(rel, set, attribute_values))
      # If it works then add the set to coverings and add the attribute to single_coverings
			coverings.push(set)
      single_coverings.push(attribute)
		end
	}
  # Remove single_coverings from the attributes used to construct larger sets
  nd_attributes -= single_coverings

	# Make all subsets that contain more than 1 attribute
	(2...max_partition_size).each do|i|
    # Check each set of size i
		new_sets = nd_attributes.combination(i)
		new_sets.each{|set|
      # Check that the set is minimal
			if minimal(set, coverings)
        # Then check that the set covers the decision attribute's partition
				if proper_subset(da_partition, partition(rel, set, attribute_values))
					coverings.push(set)
				end
			end
		}
	end

	##### Create Rules #####
  # The set of all rule sets
  full_rule_set = Array.new
  # Make a rule set for each covering
  coverings.each {|covering|
    # The set of all rules for this covering
    rules_for_this_covering = Array.new
    # Make a copy of all instances
    insts = rel.instances.dup
    # If there are instances left in insts more rules can be made
    while !insts.empty?
      # Build an array to hold the conditions and results of each rule
      rule = Array.new(2) { Array.new(0) }
      # Get each condition statement for each element of the covering
      (0...covering.length).each do|i|
        rule[0].push(insts[0][covering[i]])
      end
      # Get the resulting decision attribute values
      (0...d_attributes.length).each do|i|
        rule[1].push(insts[0][d_attributes[i]])
      end
      # Find all instances that are covered by the rule
      inst_that_fit_rule = Array.new
      (0...insts.length).each do|k|
        # Preset equal for a control variable
        equal = true
        (0...covering.length).each do |j|
          # If any condition of the rule is not met equal is set to false
          unless rule[0][j] == insts[k][covering[j]]
            equal = false
          end
        end
        # If every condition of the rule is met then that instance is added to the array
        if equal
          inst_that_fit_rule.push(k)
        end
      end
      # Remove each instance that is covered by the rule so that removal is easy
      inst_that_fit_rule.reverse!
      inst_that_fit_rule.each {|i|
        insts.delete_at(i)
      }
      # If the rule affects at least the min number of instances then add the rule to the list
      if inst_that_fit_rule.length >= min_covering
        rule.push(inst_that_fit_rule.length)
        # Add this rule to the set of rules for this covering
        rules_for_this_covering.push(rule)
      end
    end
    # Add the rule set for this covering to the set of all rule sets
    full_rule_set.push(rules_for_this_covering)
  }

  ##### Print desired readout #####
  # Print the set of decision attributes
  print 'Decision attribute :'
  p d_attributes
  # Print the values number of each value for each decision attribute
  d_attributes.each{|attr|
    puts "Distribution of values for attribute #{rel.attributes[attr].name}:"
    (0...attribute_values[attr].length).each {|i|
      puts " Value: #{attribute_values[attr][i]} Occurrences: #{rel.instances.count(attribute_values[attr][i])}"
    }
  }
  # Print all covering and rule sets
  # If there are no coverings say so
  if coverings.empty?
    puts 'No coverings could be found with these specifications'
  end
	(0...coverings.length).each {|i|
    print 'Rules for covering '
    p coverings[i]
    # If there are no rules generated then say so
    if full_rule_set.empty?
      puts 'No rules for this covering meet the minimum requirement'
    else
      p full_rule_set[i]
    end
  }
end
	# End of Program
