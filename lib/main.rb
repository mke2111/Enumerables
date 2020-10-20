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

  def my_select
    to_enum(:my_select) unless block_given?

    items = []
    my_each { |item| items << item if yield(item) }
    items
  end

  def my_all?(argument = nil)
    if block_given?
      my_each { |item| return false unless yield(item) }
      return true
    end
    argument.nil? ? argument.class.to_s : my_all? { |item| item }

    if argument.class.to_s == 'Class'
      my_all? { |item| item.is_a? argument }
    elsif argument.class.to_s == 'Regexp'
      my_all? { |item| item =~ argument }
    else
      my_all? { |item| item == argument }
    end
  end

  def my_any?(argument = nil)
    if block_given?
      my_each { |item| return true if yield(item) }
      return false
    end
    argument.nil? ? argument.class.to_s : my_any? { |item| item }

    if argument.class.to_s == 'Class'
      my_each { |item| return true if item.is_a? argument }
    elsif argument.class.to_s == 'Regexp'
      my_each { |item| return true if item =~ argument }
    else
      my_each { |item| return true if item == argument }
    end
    false
  end

  def my_none?(argument = nil, &block)

    !my_any?(argument, &block)

  end

  def my_count(argument = nil)
    count = 0
    if block_given? || !argument.nil?
      block_given? ? my_each { |item| count += 1 if yield(item) } : my_each { |item| count += 1 if argument == item }
    else
      count = self.length
    end
    count
  end

  def my_map(argument = nil)
    return to_enum(:my_map) unless block_given?

    items = []
    if argument.nil?
      my_each { |item| items << (yield(item)) }
    else
      my_each { |item| items << (argument.call(item)) }
    end
    items
  end

  def my_inject(argument = nil, sym = nil)
    if block_given?
      accumulator = argument
      my_each do |item|
        accumulator = accumulator.nil? ? item : yield(accumulator, item)
      end
      accumulator
    elsif !argument.nil? && (argument.is_a?(Symbol) || argument.is_a?(String))
      accumulator = nil
      my_each do |item|
        accumulator = accumulator.nil? ? item : accumulator.send(argument, item)
      end
      accumulator
    elsif !sym.nil? && (sym.is_a?(Symbol) || sym.is_a?(String))
      accumulator = argument
      my_each do |item|
        accumulator = accumulator.nil? ? item : accumulator.send(sym, item)
      end
      accumulator
    end
  end

end