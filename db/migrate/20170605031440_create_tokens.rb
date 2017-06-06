class CreateTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :tokens do |t|
      t.string :user_id 
      t.string :access_token
      t.string :refresh_token
      t.datetime :expire_access_token
      t.datetime :expire_refresh_token

      t.timestamps
    end
    add_index :tokens, :user_id, unique: true
  end
end
