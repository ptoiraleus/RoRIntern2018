
def beer(counter)
  numbers = ['one', 'two', 'three', 'four', 'five']
  if(counter>1 && counter<=5)
    "#{numbers[counter-1]} bottles"
  elsif counter == 1
    "#{numbers[counter-1]} bottle"
  elsif (counter == 0)
    'no more bottles'
  else
    "#{counter} bottles"
  end
end

x = ARGV[0].to_i
if(x == nil)
  x = 1
end

x.times do

counter = 99
begin
  puts "#{beer(counter)} of beer on the wall, #{beer(counter)} of beer.
  Take one down and pass it around, #{beer(counter-1)} of beer on the wall. \n"
  counter = counter - 1
end while counter >= 1

puts 'No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.'
end
