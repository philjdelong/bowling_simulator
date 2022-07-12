class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :target_score

      t.timestamps
    end
  end
end
