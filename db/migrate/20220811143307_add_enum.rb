class AddEnum < ActiveRecord::Migration[7.0]
  def change
    change_table :books do |t|
      t.integer :category
    end
  end
end
