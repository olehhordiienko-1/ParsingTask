def brackets_closed_in_sequence?(string)
  stack = []
  open_brackets = %w|( { [|
  close_brackets = %w|) } ]|

  string.each_char do |char|
    if open_brackets.include?(char)
      stack.push(char)
    elsif close_brackets.include?(char)
      return false if stack.empty?
      top = stack.pop
      return false unless open_brackets.index(top) == close_brackets.index(char)
    end
  end

  stack.empty?
end

puts brackets_closed_in_sequence?("()[]{}")
puts brackets_closed_in_sequence?("([{]})")
puts brackets_closed_in_sequence?("({[()]})")