require 'pry'

class BowlingController < ApplicationController
    def index
        if Game.last
            game = Game.last
        else
            game = Game.create(target_score: 0)
        end
        
        @target_score = game.target_score
        @max_score = 235
        
        if @target_score > @max_score
            flash[:message] = "SHUT THE FUCK UP DONNIE"
            game.target_score = 0
            
            @minimum_score = 0
            @minimum_rolls = "-"
            @minimum_game_count = 0
            
            @total_time = 0
        else
            @start_time = Time.now
            
            minimum_score_data = game.minimum_score(game.target_score)
            @minimum_score = minimum_score_data[:game_score]
            @minimum_rolls = minimum_score_data[:rolls]
            @minimum_game_count = minimum_score_data[:game_count]
            
            @total_time = Time.now - @start_time
            flash.clear
        end
    end
    
    def update
        @max_score = 235
        game = Game.last
        target_score = params[:target_score].to_i

        game.target_score = target_score
        game.save

        redirect_to "/"
    end
end