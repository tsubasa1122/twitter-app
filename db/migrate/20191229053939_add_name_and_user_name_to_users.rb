class AddNameAndUserNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false, first: :true
    add_column :users, :username, :string, null: false, after: :name
  end
end
