puts "Break"

for i in 0..5
   if i > 2 then
      break
   end
   puts "Value of local variable is #{i}"
end

puts "Next"

for i in 0..5
   if i < 3 then
      next
   end
   puts "Value of local variable is #{i}"
end