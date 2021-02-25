class AddAreaIdToParks < ActiveRecord::Migration[6.0]
  def change
    add_column :parks, :area_id, :integer
  end
end
