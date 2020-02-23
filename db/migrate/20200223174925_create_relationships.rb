class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :followed, null: false
      t.references :following, null: false
      t.timestamps
      t.foreign_key :users, column: :followed_id
      t.foreign_key :users, column: :following_id
    end
  end
end
