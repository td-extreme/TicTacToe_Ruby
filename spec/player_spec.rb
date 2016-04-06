# ./spec/player_spec.rb
require 'player'

describe Player do

  describe "mark" do
    let(:myPlayer) { Player.new('X', 'Human') }

    it "Should return X when players mark is set to X" do
      expect(myPlayer.mark).to eq('X')
    end

  end

end
