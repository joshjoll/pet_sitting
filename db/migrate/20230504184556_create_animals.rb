class CreateAnimals < ActiveRecord::Migration[7.0]
  def change
    create_table :animals do |t|
      t.string :animal_type
      t.integer :hourly_cost
      
      t.timestamps
    end
  end
end
