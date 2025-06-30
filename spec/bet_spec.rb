require_relative "spec_helper"
require_relative "../bet"

RSpec.describe Bet do
  # examples here…
  let(:bet) { Bet.new }

    describe "#roll_dice" do
      it "returns a number between 2 and 12" do
        50.times do
          result = bet.send(:roll_dice)
          expect(result).to be_between(2, 12)
        end
      end
    end

    describe "#check_guess" do
      context "when guess matches outcome parity" do
        it "prints the win message" do
          bet.instance_variable_set(:@outcome, 4)
          bet.instance_variable_set(:@guess,  "even")

          expect {
            bet.send(:check_guess)
          }.to output(/Aayyy! You won!/).to_stdout
        end
      end

      context "when guess does not match" do
        it "prints the loss message" do
          bet.instance_variable_set(:@outcome, 3)
          bet.instance_variable_set(:@guess,  "even")

          expect {
            bet.send(:check_guess)
          }.to output(/Ope\.\.\.That's rough buddy/).to_stdout
        end
      end
    end

    it "loads the decline message when you say no" do
      # stub $stdin to feed “no\n”
      input  = StringIO.new("no\n")
      output = StringIO.new
      $stdin  = input
      $stdout = output

      Bet.new.play

      expect(output.string).to include("Ah a responsible type eh? Fine then")
    end

end

 

   