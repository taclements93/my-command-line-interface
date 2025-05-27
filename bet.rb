require "active_support/all"





# puts "DEBUG: I read: ‹#{their_answer}›"

 
class Bet 
  def initialize
    return
  end

  def play
    wanna_bet
    process_bet
    return
  end

  private #everything below is helper methods

  def wanna_bet #ask the user the make a bet
    puts "Wanna make a bet? Yes or No?"
    @answer = gets.chomp.downcase
    return
  end

  def process_bet 
    if @answer == "yes"
      load "./agree.rb"
      ask_even_or_odd
      roll_dice
      check_guess
      retry_answer
    elsif @answer == "no"
      load "./decline.rb"
    else 
      puts "Please answer yes or no"
      wanna_bet
      process_bet

    end 
    return
  end

  def ask_even_or_odd
    puts "Even or odd"
    @guess = gets.chomp.downcase
    return
  end

  def roll_dice
       die1 = rand(1..6)
       die2 = rand(1..6)
       @outcome = die1 + die2
       puts "You rolled a #{@outcome}"
       return @outcome
       
 end 

  def check_guess
    if @outcome.even? && @guess == "even" || @outcome.odd? && @guess == "odd"
      puts "Aayyy! You won!"
    else
      puts "Ope...That's rough buddy"
    end
    return
  end

  def retry_answer
    puts "Roll again? Yes or no?"
    reroll = gets.chomp.downcase
    if reroll == "yes"
      ask_even_or_odd
      roll_dice
      check_guess
      retry_answer
    else
      puts "Then sashay away"
    end
    return
  end
end

if __FILE__ == $0
  Bet.new.play
end

       




#   def choice(answer)
#     if answer == "yes"
#     # puts "DEBUG: hit the YES branch"
#       load "./agree.rb"

#       puts "Even or Odd?"
#       guess = gets.chomp.downcase
    
#       load "./roll_dice.rb"
#       outcome = roll_dice

    

#       if outcome.even? && guess == "even" ||
#         outcome.odd? && guess == "odd"
#         puts "Aayyyy! You won!" 
#       else 
#         puts "Ope...that's rough buddy..."
#       end
#       puts "You rolled a #{outcome}"
#       puts "Roll again?"
#       retry_answer = gets.chomp.downcase
#       if retry_answer == "yes"
#         choice("yes")
#       else
#         puts "Then sashay away"
    
#       end

#     elsif answer == "no"
#     # puts "DEBUG: hit the NO branch"
#       load "./decline.rb"
  
#     else 
#     # puts "DEBUG: hit the ELSE branch"
#       puts "please answer yes or no"
#     end
#   end

# end

# choice(their_answer)



