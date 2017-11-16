class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.belongs_to :user
      t.belongs_to :attraction

      t.timestamps null: false
    end
  end
end
