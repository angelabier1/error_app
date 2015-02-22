class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user_email
      t.text :body
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
