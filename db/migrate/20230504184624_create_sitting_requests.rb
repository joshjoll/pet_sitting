class CreateSittingRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :sitting_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.string :pet_name
      t.references :animal, null: false, foreign_key: true
      t.datetime :drop_off
      t.datetime :pickup
      t.integer :request_status
      t.integer :cost

      t.timestamps
    end
  end
end
