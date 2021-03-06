require_relative 'main.rb'

# [1, 2, 3, 5].my_each { |x| p x }
# puts
# [1, 2, 3, 5].each { |x| p x } #compare
# puts
# p [0,1,2,3,4].my_each
# puts

# [1, 2, 3, 5].my_each_with_index { |x, y| puts "#{x} at #{y}" }
# puts
# [1, 2, 3, 5].each_with_index { |x, y| puts "#{x} at #{y}" }#compare
# puts

# p [1, 2, 3, 4].my_select { |x| x % 2 == 0}
# puts
# p [1, 2, 3, 4].select { |x| x % 2 == 0 }#compare
# puts
# p (1..10).my_select { |i|  i % 3 == 0 }   #=> [3, 6, 9]
# puts
# p (1..10).select { |i|  i < 3 }   #=> [3, 6, 9]
# puts
# p [:foo, :bar].my_select { |x| x == :foo }   #=> [:foo]
# puts
# p [:foo, :bar].select { |x| x == :foo }   #=> [:foo]
# puts

# p [1, 2].my_all? { |x| x > 0 }
# p [1, 2].all? { |x| x > 0 }
# p ['alpha', 'apple', 'allen key'].my_all?{ |x| x[0] == 'a' }
# puts
# p ['alpha', 'apple', 'allen key'].all?{ |x| x[0] == 'a' }
# puts
# p %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
# puts
# p %w[ant bear cat].all? { |word| word.length >= 4 } #=> false
# puts
# p %w[ant bear cat].my_all?(/t/)                        #=> false
# puts
# p %w[ant bear cat].all?(/t/)                        #=> false
# puts
# p [1, 2i, 3.14].my_all?(Numeric)                       #=> true
# puts
# p [1, 2i, 3.14].all?(Numeric)                       #=> true
# puts
# p [nil, true, 99].my_all?                              #=> false
# puts
# p [nil, true, 99].all?                              #=> false
# puts
# p [].my_all?                                           #=> true
# puts
# p [].all?                                           #=> true
# puts
# p [1, true, 'hi', []].my_all?
# p [1, true, 'hi', []].all?
# true_array = [1, true, 'hi', []]
# puts true_array.my_all? true
# puts true_array.all? true

# p ['lpha', 'apple', 'llen key'].my_any?{ |x| x[0] == 'a' }
# puts
# p ['lpha', 'pple', 'allen key'].any?{ |x| x[0] == 'a' }
# puts
# p %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
# puts
# p %w[ant bear cat].any? { |word| word.length >= 3 } #=> true
# puts
# p %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
# puts
# p %w[ant bear cat].any? { |word| word.length >= 4 } #=> true
# puts
# p %w[ant bear cat].my_any?(/d/)                        #=> false
# puts
# p %w[ant bear cat].any?(/d/)                        #=> false
# puts
# p [nil, true, 99].my_any?(Integer)                     #=> true
# puts
# p [nil, true, 99].any?(Integer)                     #=> true
# puts
# p [nil, true, 99].my_any?                              #=> true
# puts
# p [nil, true, 99].any?                              #=> true
# puts
# p [].my_any?                                           #=> false
# puts
# p [].any?                                           #=> false
# puts
# p [nil, false, nil, false].my_any?
# puts
# p [nil, false, nil, false].any?

# p ['lpha', 'pple', 'llen key'].my_none?{ |x| x[0] == 'a' }
# puts
# p ['lpha', 'pple', 'llen key'].none?{ |x| x[0] == 'a' }
# puts
# class DeathCab
# end
# plans = DeathCab.new()
# p [1, 3.14, 42].my_none?(Float)  # => output false
# puts
# p [1, 3.14, 42].none?(Float)  # => output false
# puts
# p ["BY" "FIRE" "BE" "PURGED", %w[DIE INSECT].to_enum].my_none?(Enumerable)  # => output false
# puts
# p ["BY" "FIRE" "BE" "PURGED", %w[DIE INSECT].to_enum].none?(Enumerable)  # => output false
# puts
# p ["With", "eyes", "like", "the", "summer", 3].my_none?(Float)  # => output true
# puts
# p ["With", "eyes", "like", "the", "summer", 3].none?(Float)  # => output true
# puts
# p [1.12, 3.14, 3.15].my_none?(String)  # => output true
# puts
# p [1.12, 3.14, 3.15].none?(String)  # => output true
# puts
# p [plans, plans, plans].my_none?(DeathCab)  # => output false
# puts
# p [plans, plans, plans].none?(DeathCab)  # => output false
# puts
# p [nil, false, nil, false].my_none?
# puts
# p [nil, false, nil, false].none?

# arr = [1, 2, 3, 4]
# p arr.my_count { |i| i%2==0}
# puts
# p arr.count { |i| i%2==0}
# puts
# p arr.my_count               # => 4
# puts
# p arr.count               # => 4
# puts
# p arr.my_count(2)            # => 2
# puts
# p arr.count(2)            # => 2
# puts
# p [1,2,3,4,4,7,7,7,9].my_count { |i| i > 1 }
# puts
# p [1,2,3,4,4,7,7,7,9].count { |i| i > 1 }
# puts
# p (1..10).my_count
# puts
# p (1..10).count

# p [1,2,3,4,4,7,7,7,9].my_map { |i| i*4 }
# puts
# p [1,2,3,4,4,7,7,7,9].map { |i| i*4 }
# puts
# p (1..4).my_map { |i| i*i }
# puts
# p (1..4).map { |i| i*i }
# puts
# p (1..4).my_map { "cat"  }
# puts
# p (1..4).map { "cat"  }
# puts
# p proc = Proc.new { |i| i*i }
# puts

# p [1,2,3,4,4,7,7,7,9].my_inject(0){|running_total, item| running_total + item }
# puts
# p [1,2,3,4,4,7,7,7,9].inject(0){|running_total, item| running_total + item }
# puts
# p (5..10).my_inject(:+)
# puts
# p (5..10).inject(:+)
# puts
# p (5..10).my_inject { |sum, n| sum + n }
# puts
# p (5..10).inject { |sum, n| sum + n }
# puts
# p (5..10).my_inject(1, :*)
# puts
# p (5..10).inject(1, :*)
# puts
# p (5..10).my_inject(1) { |product, n| product * n }
# puts
# p (5..10).inject(1) { |product, n| product * n }
# puts
# p [2,4,5].my_inject(:*) #POINT NUMBER 10
# puts
# p [2,4,5].inject(:*) #POINT NUMBER 10
# puts
# longest = %w{ cat sheep bear }.my_inject do |memo, word|
#  memo.length > word.length ? memo : word
# end
# longest
# puts
# longest = %w{ cat sheep bear }.inject do |memo, word|
#  memo.length > word.length ? memo : word
# end
# longest

# p [nil, false, nil, false].my_inject
# puts
# p [nil, false, nil, false].inject

# p multiply_els([2,4,5])

# my_proc = Proc.new { |i| i*4 }
# p [1,2,3,4,4,7,7,7,9].my_map { |i| i*4 }
# puts
# p [1,2,3,4,4,7,7,7,9].my_map(&my_proc)
