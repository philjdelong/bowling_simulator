class BowlingController < ApplicationController
    def index
        game = Game.new()
        @game_quote = "SHUT THE FUCK UP DONNIE"
        @game_score = 0
        @rolls = game.generate_rolls
        @game_score = game.calculate_game_score(@rolls)
    end
end