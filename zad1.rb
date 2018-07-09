
def lev s, t
  return t.size if s.empty?
  return s.size if t.empty?
  return [ (lev s.chop, t) + 1,
           (lev s, t.chop) + 1,
           (lev s.chop, t.chop) + (s[-1, 1] == t[-1, 1] ? 0 : 1)
       ].min
end

puts 'BY ARGUMENTS '
puts "Distance is #{lev(ARGV[0], ARGV[1])}"
ARGV.clear

puts "\nBY USER INPUT"
puts 'Give me first word'
first = gets.chomp
puts 'Give me second word'
second = gets.chomp
puts "Distance is #{lev(first, second)}"

puts "\nBY FILE"
array = []
file='words.txt'
File.readlines(file).each do |line|
   array.push(line)
end

puts "Distance is #{lev(array[0], array[1])}"
