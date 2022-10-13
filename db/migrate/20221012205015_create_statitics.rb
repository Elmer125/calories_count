class CreateStatitics < ActiveRecord::Migration[7.0]
  def change
    create_table :statitics do |t|
      t.string :token
      t.datetime :expires_date
      t.belongs_to :user, null: false, foreign_key: true
      t.string :email

      t.timestamps
    end
  end
end
