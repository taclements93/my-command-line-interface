
class Bet 

  attr_accessor :answer, :guess, :outcome

  def initialize
    @answer  = nil
    @guess   = nil
    @outcome = nil
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
    self.answer = gets.chomp.downcase
    return
  end
  
  def ask_even_or_odd
    loop do
    puts "even or odd?"
    self.guess = gets.chomp.downcase
    return guess if guess == "even" || guess == "odd"
    puts "Please choose even or odd"
    end
    return
  end 
  
  def process_bet 
    if answer == "yes"
      load "./agree.rb"
      guess = ask_even_or_odd
      outcome = roll_dice
      check_guess
      retry_answer
    elsif answer == "no"
      load "./decline.rb"
    else 
      puts "Please answer yes or no"
      wanna_bet
      process_bet

    end 
    return
  end


  def roll_dice
       die1 = rand(1..6)
       die2 = rand(1..6)
       self.outcome = die1 + die2
       puts "You rolled a #{outcome}"
       return outcome
       
 end 

  def check_guess
    if (outcome.even? && guess == "even") || (outcome.odd? && guess == "odd")
      puts "Aayyy! You won!"
    elsif !(outcome.even? && guess == "even") || !(outcome.odd? && guess == "odd")
      puts "Ope...That's rough buddy"
    # else 
    #   puts "Please choose even or odd"
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
