class CreateLabResults < ActiveRecord::Migration[5.1]
  def change
    create_table :lab_results do |t|
      t.integer :number
      t.string :array
      t.string :double_array
      t.integer :count

      t.timestamps
    end
  end
end
