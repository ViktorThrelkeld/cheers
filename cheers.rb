
puts "What's your name?"
name = gets
name = name.upcase.chomp
puts "Thanks, " +name
hyphen = ['-']
space = [' ']
vowel = ["A", "E", "I", "O", "U"]
count = name.length
i=0
while i < count do
  if hyphen.include? name[i]
    i= i+1
  end
  if space.include? name[i]
    break
  end
  if vowel.include? name[i]
    puts "Give me an.. " +name[i]
  else
    puts "Give me a.. " +name[i]
  end
  i = i + 1
end
puts "#{name}'s just GRAND!"


# puts "Or:"

# name.each_char do |char|
#   puts char
# end


