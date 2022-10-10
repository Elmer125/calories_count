class CreateCalories < ActiveRecord::Migration[7.0]
  def change
    create_table :calories do |t|
      t.integer :calories_number
      t.integer :burned_or_consumed, default: 0
      t.text :comment

      t.timestamps
    end
  end
end
