require "active_support/all"

pp "Wanna make a bet? yes or no?"

their_answer = gets.chomp.downcase

puts "DEBUG: I read: ‹#{their_answer}›"


def choice(answer)
  if answer == "yes"
    puts "DEBUG: hit the YES branch"
    load "./agree.rb"
  elsif answer == "no"
    puts "DEBUG: hit the NO branch"
    load "./decline.rb"
  else 
    puts "DEBUG: hit the ELSE branch"
    puts "please answer yes or no"
  end
end

choice(their_answer)

