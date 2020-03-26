class CreateStatistics < ActiveRecord::Migration[5.0]
  def change
    create_table :statistics do |i|
      i.integer :roll_id
    end
  end
end
