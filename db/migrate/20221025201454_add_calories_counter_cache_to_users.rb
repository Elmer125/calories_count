class AddCaloriesCounterCacheToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :calories_count, :integer
  end
end
