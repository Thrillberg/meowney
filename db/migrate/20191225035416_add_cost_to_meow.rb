class AddCostToMeow < ActiveRecord::Migration[6.0]
  def change
    add_column :meows, :cost, :integer
  end
end
