class CreateParks < ActiveRecord::Migration[6.0]
  def change
    create_table :parks do |t|
      t.string :name,     null: false
      t.string :address,  null: false
      t.timestamps
    end
  end
end
