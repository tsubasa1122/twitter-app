class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.string :account_name, null: false
      t.string :description
      t.string :location
      t.string :website

      t.timestamps
    end
    add_index :user_profiles, :name
    add_index :user_profiles, :account_name
  end
end
