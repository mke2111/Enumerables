# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity

# my_Enumerable
module Enumerable
  # -------------my_each-----------

  def my_each
    return to_enum(:my_each) unless block_given?

    self_item = self
    count = 0
    items = to_a if self_item.class == Hash || Range

    until count > items.length - 1
      yield(items[count])
      count += 1
    end
    self
  end

  # ------------my_each_with_index----------

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    self_item = self
    items = to_a if self_item.class == Hash || Range
    count = 0
    until count > items.length - 1
      yield(items[count], count)
      count += 1
    end
    self
  end

  # ------------my_select----------

  def my_select
    return to_enum(:my_each) unless block_given?

    items = []
    my_each { |item| items << item if yield item }
    items
  end

  # ------------my_all?----------

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
    elsif argument.nil?
      my_each { |item| return false if item == false || item.nil? }
    else
      my_all? { |item| item == argument if item != true }
    end
  end

  # ------------my_any?----------

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
    elsif argument.nil?
      my_each { |item| return true if item }
    else
      my_each { |item| return true if item == argument }
    end
    false
  end

  # ------------my_none?----------

  def my_none?(argument = nil, &block)
    !my_any?(argument, &block)
  end

  def my_count(argument = nil)
    count = 0
    if block_given? || !argument.nil?
      block_given? ? my_each { |item| count += 1 if yield(item) } : my_each { |item| count += 1 if argument == item }
    else
      object = self
      count = object.size
    end
    count
  end

  # ------------my_map----------

  def my_map(argument = nil)
    return to_enum(:my_map) unless block_given?

    items = []
    if argument.nil?
      my_each { |item| items << yield(item) }
    else
      my_each { |item| items << argument.call(item) }
    end
    items
  end

  # ------------my_inject----------

  def my_inject(argument = nil, sym = nil)
    if (argument.is_a?(Symbol) || argument.is_a?(String)) && (!argument.nil? && sym.nil?)
      sym = argument
      argument = nil
    end

    if !block_given? && !sym.nil?
      my_each { |item| argument = argument.nil? ? item : argument.send(sym, item) }
    else
      my_each { |item| argument = argument.nil? ? item : yield(argument, item) }
    end
    argument
  end
end

def multiply_els(items)
  items.my_inject { |result, item| result * item }
end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
