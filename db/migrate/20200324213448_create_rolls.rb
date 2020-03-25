class CreateRolls < ActiveRecord::Migration[5.0]
  def change
    create_table :rolls do |i|
      i.integer :value
      i.integer :player_id
    end
  end
end
