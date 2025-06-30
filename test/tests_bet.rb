 require "minitest/autorun"
 require_relative "../bet"

 class TestBet < Minitest::Test
   def setup
     @bet = Bet.new
   end

   def test_roll_dice_range
     50.times do
       result = @bet.send(:roll_dice)
       assert_operator result, :>=, 2
       assert_operator result, :<=, 12
     end
   end

   def test_check_guess_win_message
     @bet.instance_variable_set(:@outcome, 4)
     @bet.instance_variable_set(:@guess,  "even")

     # capture stdout
     out = capture_io { @bet.send(:check_guess) }.first
     assert_match(/Aayyy! You won!/, out)
   end

   def test_check_guess_loss_message
     @bet.instance_variable_set(:@outcome, 3)
     @bet.instance_variable_set(:@guess,  "even")

     out = capture_io { @bet.send(:check_guess) }.first
     assert_match(/Ope\.\.\.That's rough buddy/, out)
   end

   def test_play_decline
     input  = StringIO.new("no\n")
     output = StringIO.new
     $stdin, $stdout = input, output

     @bet.play

     assert_includes output.string, "Ah a responsible type eh? Fine then"
   ensure
     $stdin, $stdout = STDIN, STDOUT
   end
 end