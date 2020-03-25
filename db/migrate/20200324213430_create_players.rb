class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |i|
      i.string :name
      i.integer :roll_id
    end
  end
end
