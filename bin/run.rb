require_relative '../config/environment'

def welcome
  puts "Hello, welcome to the Music Database."
end

def gets_user_input
  gets.chomp.downcase
end

puts "enter a artist name"
input = gets_user_input
p find_by_name(input)

# welcome
# puts "Please enter a group (a,b,c,d,e,f): "
#
# input = gets_user_input
# best_team_in_group(input)
#
# puts "Enter 'y' if you wish to see the best team in all brackets, else press enter."
# input = gets_user_input
# if input == 'y'
#   best_team
# end
#
# puts "Enter 'y' if you wish to see the team with the most points, else press enter."
#
# input = gets_user_input
# if input == 'y'
#   team_with_most_points
# end
#
# puts
