class CreateMeows < ActiveRecord::Migration[6.0]
  def change
    create_table :meows do |t|
      t.string :body

      t.timestamps
    end
  end
end
