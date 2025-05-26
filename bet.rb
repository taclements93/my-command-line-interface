require "active_support/all"

pp "Wanna make a bet? yes or no?"

their_answer = gets.chomp.downcase

# puts "DEBUG: I read: ‹#{their_answer}›"

 
class Bet
  def initialize
    return
  end

  def choice(answer)
    if answer == "yes"
    # puts "DEBUG: hit the YES branch"
      load "./agree.rb"

      puts "Even or Odd?"
      guess = gets.chomp.downcase
    
      load "./roll_dice.rb"
      outcome = roll_dice

    

      if outcome.even? && guess == "even" ||
        outcome.odd? && guess == "odd"
        puts "Aayyyy! You won!" 
      else 
        puts "Ope...that's rough buddy..."
      end
      puts "You rolled a #{outcome}"
      puts "Roll again?"
      retry_answer = gets.chomp.downcase
      if retry_answer == "yes"
        choice("yes")
      else
        puts "Then sashay away"
    
      end

    elsif answer == "no"
    # puts "DEBUG: hit the NO branch"
      load "./decline.rb"
  
    else 
    # puts "DEBUG: hit the ELSE branch"
      puts "please answer yes or no"
    end
  end

end

choice(their_answer)



