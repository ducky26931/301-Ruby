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

def partition (rel, attrs, attribute_values)
	parts = Array.new
	case attrs.length
	when 1
		part = Array.new(attribute_values[attrs[0]].length, 
				Array.new)
		(0...rel.instances.length).each do|i|
			part[lookup(rel.instances[i][attrs[0]], attrs[0], attribute_values)].push(i) # Find the value of the attribute for this instance and add it to the spot in partition
		end
		part.each{|party|
			unless party.empty?
				parts.push(party)
			end
		}
	when 2
		part = Array.new(attribute_values[attrs[0]].length, 
				Array.new(attribute_values[attrs[1]].length, Array.new))
		(0...rel.instances.length).each do |i|
			part[lookup(rel.instances[i][attrs[0]], attrs[0], attribute_values)]
				[lookup(rel.instances[i][attrs[1]], attrs[1], attribute_values)].push(i) # Find the value of the attribute for this instance and add it to the spot in partition
		end
		part.each{|part0|
			part0.each {|part1|
				unless part1.empty?
					parts.push(part1)
				end
			}
		}
	when 3
		part = Array.new(attribute_values[attrs[0]].length, 
				Array.new(attribute_values[attrs[1]].length, 
				Array.new(attribute_values[attrs[2]].length, Array.new)))
		(0...rel.instances.length).each do |i|
			part[lookup(rel.instances[i][attrs[0]], attrs[0], attribute_values)]
				[lookup(rel.instances[i][attrs[1]], attrs[1], attribute_values)]
				[lookup(rel.instances[i][attrs[2]], attrs[2], attribute_values)].push(i) # Find the value of the attribute for this instance and add it to the spot in partition
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
		part = Array.new(attribute_values[attrs[0]].length, 
				Array.new(attribute_values[attrs[1]].length, 
				Array.new(attribute_values[attrs[2]].length, 
				Array.new(attribute_values[attrs[3]].length, Array.new))))
		(0...rel.instances.length).each do |i|
			part[lookup(rel.instances[i][attrs[0]], attrs[0], attribute_values)]
				[lookup(rel.instances[i][attrs[1]], attrs[1], attribute_values)]
				[lookup(rel.instances[i][attrs[2]], attrs[2], attribute_values)]
				[lookup(rel.instances[i][attrs[3]], attrs[3], attribute_values)].push(i) # Find the value of the attribute for this instance and add it to the spot in partition
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
		part = Array.new(attribute_values[attrs[0]].length, 
				Array.new(attribute_values[attrs[1]].length, 
				Array.new(attribute_values[attrs[2]].length, 
				Array.new(attribute_values[attrs[3]].length, 
				Array.new(attribute_values[attrs[4]].length, 
				Array.new)))))
		(0...rel.instances.length).each do |i|
			part[lookup(rel.instances[i][attrs[0]], attrs[0], attribute_values)]
				[lookup(rel.instances[i][attrs[1]], attrs[1], attribute_values)]
				[lookup(rel.instances[i][attrs[2]], attrs[2], attribute_values)]
				[lookup(rel.instances[i][attrs[3]], attrs[3], attribute_values)]
				[lookup(rel.instances[i][attrs[4]], attrs[4], attribute_values)].push(i) # Find the value of the attribute for this instance and add it to the spot in partition
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
		part = Array.new(attribute_values[attrs[0]].length, 
				Array.new(attribute_values[attrs[1]].length, 
				Array.new(attribute_values[attrs[2]].length, 
				Array.new(attribute_values[attrs[3]].length, 
				Array.new(attribute_values[attrs[4]].length, 
				Array.new(attribute_values[attrs[5]].length, 
				Array.new))))))
		(0...rel.instances.length).each do |i|
			part[lookup(rel.instances[i][attrs[0]], attrs[0], attribute_values)]
				[lookup(rel.instances[i][attrs[1]], attrs[1], attribute_values)]
				[lookup(rel.instances[i][attrs[2]], attrs[2], attribute_values)]
				[lookup(rel.instances[i][attrs[3]], attrs[3], attribute_values)]
				[lookup(rel.instances[i][attrs[4]], attrs[4], attribute_values)]
				[lookup(rel.instances[i][attrs[5]], attrs[5], attribute_values)].push(i) # Find the value of the attribute for this instance and add it to the spot in partition
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
		part = Array.new(attribute_values[attrs[0]].length, 
				Array.new(attribute_values[attrs[1]].length, 
				Array.new(attribute_values[attrs[2]].length, 
				Array.new(attribute_values[attrs[3]].length, 
				Array.new(attribute_values[attrs[4]].length, 
				Array.new(attribute_values[attrs[5]].length, 
				Array.new(attribute_values[attrs[6]].length, 
				Array.new)))))))
		(0...rel.instances.length).each do |i|
			part[lookup(rel.instances[i][attrs[0]], attrs[0], attribute_values)]
				[lookup(rel.instances[i][attrs[1]], attrs[1], attribute_values)]
				[lookup(rel.instances[i][attrs[2]], attrs[2], attribute_values)]
				[lookup(rel.instances[i][attrs[3]], attrs[3], attribute_values)]
				[lookup(rel.instances[i][attrs[4]], attrs[4], attribute_values)]
				[lookup(rel.instances[i][attrs[5]], attrs[5], attribute_values)]
				[lookup(rel.instances[i][attrs[6]], attrs[6], attribute_values)].push(i) # Find the value of the attribute for this instance and add it to the spot in partition
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

	attributes = (0...rel.attributes.length) # The array of all attribute indexes, an array of ints
	puts("Succesfully loaded the given dataset")
	puts("Please enter the indexes of the decisio attributes you would like to use hit enter after every attribute and  type 'done' when list is complete")
	attr_num_da = Array.new
	input = $stdin.gets.chomp!
	while input != 'done'
		attr_num_da << input.to_i
		input = $stdin.gets.chomp!
	end
	### Ask for decision attributes
	puts("Please enter the attribute number for the decision attributes")
	# 
	max_partition_size = $stdin.gets.chomp!.to_i
  puts("Please enter the minimum covering size")
  #
  min_covering = $stdin.gets.chomp!.to_i
	### If they are in range then add them d_attributes
	d_attributes = attr_num_da### The set of decision attribute indexes (ints)
	
	### Ask for max_covering_size
	
	### Ask for Min coverage for rules
	attribute_values = Array.new(rel.attributes.length, Array.new) ### Make this# An array that holds the nominal values for each attribute in a subarray
  (0...rel.attributes.length).each do |i|
    rel.instances.each{|inst|
      attribute_values[i].push(inst[i])
    }
    attribute_values[i] = attribute_values[i].uniq # Removes all duplicate values
   end

	da_partition = partition(rel, d_attributes, attribute_values) # The partition of the decision attributes
	nd_attributes = (0...rel.attributes.length).map{|idx| ### I think that this should just be a list, not a map
		idx if d_attributes.include?(idx)
		(idx)}.compact
	#of all indexes for the attributes (0,1,2,3,....) and remove every index that is in the d_attributes list
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
	(2..max_partition_size).each do|i|
		new_sets = nd_attributes.combination(i)
		new_sets.each{|set|
			if minimal(set, coverings)
				if proper_subset(da_partition, partition(rel, set, attribute_values))
					coverings.push(set)
				end
			end
		}
	end

	### Begin creating rules from this
  full_rule_set = Array.new
  coverings.each {|covering|
    rule = Array.new(2) { Array.new(0) }
    insts = rel.instances.dup
    while insts.length > min_covering
      # Get each set of condition statements for each element of the covering
      (0...covering.length).each do|i|
        rule[0].push(insts[0][covering[i]])
      end
      puts("Conditions of rule generated")
      # Get the da values
      (0...d_attributes.length).each do|i|
        rule[1].push(insts[0][d_attributes[i]])
      end
      puts("Results of rule generated")
      # Find all instances that are covered by the rule
      inst_that_fit_rule = Array.new
      (0...insts.length).each do|i|
        puts("We are checking insance number: #{i}")
        (0...covering.length).all? do |j|
          if insts[i][covering[j]].equal?(rule[0][j])
            inst_that_fit_rule.push(i)
          end
        end
      end
      # Remove each instance that is covered by the rule
      puts( "Begin to remove instances")
      inst_that_fit_rule.reverse!
      (0...inst_that_fit_rule.length).each {|i|
        insts.delete_at(inst_that_fit_rule[i])
      }
      # If the number removed is greater than the min covering then add the rule to the list
      puts("Check if the rule meets min requirements")
      if inst_that_fit_rule.length < min_covering
        rule.push(inst_that_fit_rule.length)
        full_rule_set.push(rule)
      end
    end
  }

	### Print rules and other things
end
	# End of Program
