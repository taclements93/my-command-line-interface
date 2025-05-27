 def roll_dice
       die1 = rand(1..6)
       die2 = rand(1..6)
       @outcome = die1 + die2
       puts "You rolled a #{@outcome}"
       return @outcome
       
 end 