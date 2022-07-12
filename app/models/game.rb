class Game < ApplicationRecord

    validates_presence_of :target_score

    # Generate random rolls based on rules for bowling
    def generate_rolls
        scores = []
        until scores.count == 20
            if scores.count % 2 == 1
                roll = rand(0..(10 - scores[-1]))
                scores << roll
            else
                roll = rand(0..10)
                scores << roll
            end
        end
        generate_adtl_rolls(scores)
        scores
    end

    # Generate additional roles if last frame is strike or spare  
    def generate_adtl_rolls(array)
        if array[-2] == 10
            roll = rand(0..10)
            if roll == 10
                array << roll
                array << 0
                array << rand(0..10)
            else
                array << roll
                array << rand(0..(10 - roll))
            end
        elsif array[-2] != 10 && (array[-2] + array[-1] == 10)
            array << rand(0..10)
        end
    end

    # Calculate game score after rolls have been generated
    def calculate_game_score(array)
        total_score = 0
        i = 0

        strike = array[i] == 10
        spare = (array[i] + array[i + 1].to_i == 10)
        new_frame = array.count % 2 == 0

        until i >= 20
            if strike
                if array[i + 2].to_i == 10
                    total_score = total_score + 10 + array[i + 2].to_i + array[i + 4].to_i
                else
                    total_score = total_score + 10 + array[i + 2].to_i + array[i + 3].to_i
                end
                i = i + 1
            elsif new_frame && spare
                total_score = total_score + 10 + array[i + 2].to_i
                i = i + 1
            else
                total_score = total_score + array[i].to_i
            end
            i = i + 1
        end
        total_score
    end

    # rolls = generate_rolls
    # puts "Rolls: #{rolls.count}"

    # game_score = calculate_game_score(rolls)
    # rolls = generate_rolls

    # # Simulate games until defined score is reached
    # 2.times { puts " " }

    def minimum_score(score)
        game_score = 0
        game_count = 0
        
        until game_score >= score
            game_count = game_count + 1
            rolls = generate_rolls
            game_score = calculate_game_score(rolls)
            puts "#{rolls}"
        end
        { 
            rolls: rolls,
            game_score: game_score,
            game_count: game_count
        }
    end

    # # Number of games played
    # 2.times { puts " " }

    # puts "You bowled #{game_count} games"

    # # Number of rolls for winning game
    # 2.times { puts " " }
    # puts "Numner of rolls for Winning Game: #{rolls.count}"
    # puts "#{rolls}"

    # # Final score for winning game
    # 2.times { puts " " }
    # puts "Game over!!!"
    # puts "Final score: #{game_score}"
end