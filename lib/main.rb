# my_Enumerable
module Enumerable
  # -------------my_each-----------

  def my_each
    to_enum(:my_each) unless block_given?

    count = 0
    items = to_a

    until count > items.length - 1
      yield(items[count])
      count += 1
    end
    items
  end

  # ------------my_each_with_index----------

  def my_each_with_index
    to_enum(:my_each_with_index) unless block_given?

    items = to_a
    count = 0
    until count > items.length - 1
      yield(items[count], count)
      count += 1
    end
    items
  end

end