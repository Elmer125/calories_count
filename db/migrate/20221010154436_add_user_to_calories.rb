class AddUserToCalories < ActiveRecord::Migration[7.0]
  def change
    add_reference :calories, :user, null: false, foreign_key: true
  end
end
