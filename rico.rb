require 'rubygems'
require 'backports'

#require_relative 'FILENAMEHERE.rb'
#that's what you use to include needed files
require_relative 'rarff-hotpatch.rb'

def lookup (value, attr_num, attribute_values)
  # Looks up the offset offset of the value in the attribute_values table
	attribute_values[attr_num].index(value)
end

def proper_subset (partition_da, partition_other)
  # Checks that all subpartitions of the set we are checking meet the next condition
	partition_other.all?{|part_o|
    # Checks if any subpartitions of the decision attribute set meets the next condidtions
		partition_da.any?{|part_da|
      # Checks that each element of a subpartision
			part_o.all?{|element|
				part_da.include?(element)
			}
		}# checks to see if all elements of each of other's partition is included in a partition of the DA
	}
end

def minimal (set_of_attr, coverings)
	!coverings.any? {|cover|
    cover.all?{|attr|
      set_of_attr.include?(attr)
    }
	}
end

def partition (rel, attrs, attribute_values)
	parts = Array.new
	case attrs.length
    when 1
      part = Array.new(attribute_values[attrs[0]].length){ |i| Array.new}
		(0...rel.instances.length).each do|i|
			part[attribute_values[attrs[0]].index(rel.instances[i][attrs[0]])].push(i) # Find the value of the attribute for this instance and add it to the spot in partition
		end
		part.each{|party|
			unless party.empty?
				parts.push(party)
			end
		}
	when 2
    part = Array.new(attribute_values[attrs[0]].length){ |i1|
           Array.new(attribute_values[attrs[1]].length){ |i2| Array.new}}
    (0...rel.instances.length).each do |i|
      part[attribute_values[attrs[0]].index(rel.instances[i][attrs[0]])][attribute_values[attrs[1]].index(rel.instances[i][attrs[1]])].push(i)
    end
    part.each{|part0|
      part0.each {|part1|
        unless part1.empty?
          parts.push(part1)
        end
      }
    }
	when 3
    part = Array.new(attribute_values[attrs[0]].length){ |i1|
           Array.new(attribute_values[attrs[1]].length){ |i2|
           Array.new(attribute_values[attrs[2]].length){ |i3| Array.new}}}

		(0...rel.instances.length).each do |i|
			part[attribute_values[attrs[0]].index(rel.instances[i][attrs[0]])][attribute_values[attrs[1]].index(rel.instances[i][attrs[1]])][attribute_values[attrs[2]].index(rel.instances[i][attrs[2]])].push(i)
    end
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
    part = Array.new(attribute_values[attrs[0]].length){ |i1|
           Array.new(attribute_values[attrs[1]].length){ |i2|
           Array.new(attribute_values[attrs[2]].length){ |i3|
           Array.new(attribute_values[attrs[3]].length){ |i4| Array.new}}}}
		(0...rel.instances.length).each do |i|
      part[attribute_values[attrs[0]].index(rel.instances[i][attrs[0]])][attribute_values[attrs[1]].index(rel.instances[i][attrs[1]])][attribute_values[attrs[2]].index(rel.instances[i][attrs[2]])][attribute_values[attrs[3]].index(rel.instances[i][attrs[3]])].push(i)
		end
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
    part = Array.new(attribute_values[attrs[0]].length){ |i1|
           Array.new(attribute_values[attrs[1]].length){ |i2|
           Array.new(attribute_values[attrs[2]].length){ |i3|
           Array.new(attribute_values[attrs[3]].length){ |i4|
           Array.new(attribute_values[attrs[4]].length){ |i5| Array.new}}}}}
		(0...rel.instances.length).each do |i|
      part[attribute_values[attrs[0]].index(rel.instances[i][attrs[0]])][attribute_values[attrs[1]].index(rel.instances[i][attrs[1]])][attribute_values[attrs[2]].index(rel.instances[i][attrs[2]])][attribute_values[attrs[3]].index(rel.instances[i][attrs[3]])][attribute_values[attrs[4]].index(rel.instances[i][attrs[4]])].push(i)
		end
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
    part = Array.new(attribute_values[attrs[0]].length){ |i1|
           Array.new(attribute_values[attrs[1]].length){ |i2|
           Array.new(attribute_values[attrs[2]].length){ |i3|
           Array.new(attribute_values[attrs[3]].length){ |i4|
           Array.new(attribute_values[attrs[4]].length){ |i5|
           Array.new(attribute_values[attrs[5]].length){ |i6| Array.new}}}}}}
		(0...rel.instances.length).each do |i|
      part[attribute_values[attrs[0]].index(rel.instances[i][attrs[0]])][attribute_values[attrs[1]].index(rel.instances[i][attrs[1]])][attribute_values[attrs[2]].index(rel.instances[i][attrs[2]])][attribute_values[attrs[3]].index(rel.instances[i][attrs[3]])][attribute_values[attrs[4]].index(rel.instances[i][attrs[4]])][attribute_values[attrs[5]].index(rel.instances[i][attrs[5]])].push(i)
		end
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
    part = Array.new(attribute_values[attrs[0]].length){ |i1|
           Array.new(attribute_values[attrs[1]].length){ |i2|
           Array.new(attribute_values[attrs[2]].length){ |i3|
           Array.new(attribute_values[attrs[3]].length){ |i4|
           Array.new(attribute_values[attrs[4]].length){ |i5|
           Array.new(attribute_values[attrs[5]].length){ |i6|
           Array.new(attribute_values[attrs[6]].length){ |i7| Array.new}}}}}}}
		(0...rel.instances.length).each do |i|
      part[attribute_values[attrs[0]].index(rel.instances[i][attrs[0]])][attribute_values[attrs[1]].index(rel.instances[i][attrs[1]])][attribute_values[attrs[2]].index(rel.instances[i][attrs[2]])][attribute_values[attrs[3]].index(rel.instances[i][attrs[3]])][attribute_values[attrs[4]].index(rel.instances[i][attrs[4]])][attribute_values[attrs[5]].index(rel.instances[i][attrs[5]])][attribute_values[attrs[6]].index(rel.instances[i][attrs[6]])].push(i)
		end
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
		### Repeat when 2 for all sizes up to max_subset_size (7)

	end
	return parts ### DON"T KNOW IF REDUNDANT
end

if $0 == __FILE__  # TYPE OUT A FILE NAME DUMBASS - that's for me.. because I'm smart :P
	if ARGV[0] # If an argument is provided read the given file
		arff_file = ARGV[0]
		contents = File.open(arff_file).read

		rel = Rarff::Relation.new
		rel.parse(contents)
	else # Otherwise exit and demand a filename
		puts "Please specify a filename"
		file_name = $stdin.gets.chomp!
		contents = File.open(file_name).read

		rel = Rarff::Relation.new
		rel.parse(contents)
	end

	rel.attributes.each do |attr|
		puts attr
	end

#	attributes = (0...rel.attributes.length) # The array of all attribute indexes, an array of ints
	puts("Succesfully loaded the given dataset")
  ### Ask for decision attributes
	puts "Enter the indicies of the decision attributes. Hit enter after every attribute. When finished type 'done'"
	attr_num_da = Array.new
	input = $stdin.gets.chomp!
	while input != 'done'
		attr_num_da << input.to_i
		input = $stdin.gets.chomp!
	end
	puts("Enter the maximum partition size")
	# 
	max_partition_size = $stdin.gets.chomp!.to_i
  puts("Enter the minimum covering size")
  #
  min_covering = $stdin.gets.chomp!.to_i
	### If they are in range then add them d_attributes
	d_attributes = attr_num_da### The set of decision attribute indexes (ints)
	print 'List of decision attributes:'
  p d_attributes
	attribute_values = Array.new(rel.attributes.length) { |i| Array.new }

  rel.instances.each {|inst|
    (0...rel.attributes.length).each {|attr|
      attribute_values[attr].push(inst[attr])
    }
  }
  (0...rel.attributes.length).each {|i|
    attribute_values[i] = attribute_values[i].uniq # Removes all duplicate values
  }
#   puts 'Attribute value table'
#  attribute_values.each{|attr| p attr}
 	da_partition = partition(rel, d_attributes, attribute_values) # The partition of the decision attributes
	puts 'Partition of decision attributes'
  p da_partition
  
  nd_attributes = Array.new
  (0...rel.attributes.length).each {|i| nd_attributes.push(i)}
  nd_attributes -= d_attributes

	coverings = Array.new # Array of a sets that make coverings, it starts empty.

	# Check the partition of each non-decision attribute
	single_coverings = Array.new
  nd_attributes.each {|attribute|
		set = [attribute]
		if proper_subset(da_partition, partition(rel, set, attribute_values))
			coverings.push(set) # add the list containing the attribute to coverings
      single_coverings.push(attribute) # remove the attribute from nDAttribute
		end
	}
  nd_attributes -= single_coverings

	# Make all subsets that contain more than 1 attribute
	(2...max_partition_size).each do|i|
		new_sets = nd_attributes.combination(i)
		new_sets.each{|set|
			if minimal(set, coverings)
				if proper_subset(da_partition, partition(rel, set, attribute_values))
					coverings.push(set)
				end
			end
		}
	end
  # Print all coverings
#  puts 'All coverings:'
#  coverings.each {|cover| p cover} #to print to an array ###############################################################


	### Begin creating rules from this

  full_rule_set = Array.new
  coverings.each {|covering|
    rules_for_this_covering = Array.new
    insts = rel.instances.dup
    while !insts.empty?
      rule = Array.new(2) { Array.new(0) }
      # Get each set of condition statements for each element of the covering
      (0...covering.length).each do|i|
        rule[0].push(insts[0][covering[i]])
      end
      # Get the da values
      (0...d_attributes.length).each do|i|
        rule[1].push(insts[0][d_attributes[i]])
      end
      # Find all instances that are covered by the rule
      inst_that_fit_rule = Array.new
      (0...insts.length).each do|k|
        equal = true
        (0...covering.length).each do |j|
        	temp1 = rule[0][j]
        	temp2 = insts[k][covering[j]]
          unless temp1 == temp2
            equal = false
          end
        end
        if equal
          inst_that_fit_rule.push(k)
        end
      end
      # Remove each instance that is covered by the rule
      inst_that_fit_rule.reverse!
      inst_that_fit_rule.each {|i|
        insts.delete_at(i)
      }
      # If the number removed is greater than the min covering then add the rule to the list
      if inst_that_fit_rule.length <= min_covering
        rule.push(inst_that_fit_rule.length)
#        puts 'New Rule:'
#        p rule
        rules_for_this_covering.push(rule)
      end
    end
#    puts 'New Rule Set:'
#    p rules_for_this_covering
    full_rule_set.push(rules_for_this_covering)
  }
  ### Print rules and other things

  print 'Decision attribute :'
  p d_attributes
  d_attributes.each{|attr|
    puts "Distribution of values for attribute #{rel.attributes[attr].name}:"
    (0...attribute_values.length).each {|i|
      puts " Value: #{attribute_values[attr][i]} Occurances: #{rel.instances.count{|x| x == attribute_values[attr][i]}}"
    }
  }


	(0...coverings.length).each {|i|
    print 'Rules for covering '
    p coverings[i]
    p full_rule_set[i]

  }
end
	# End of Program






















