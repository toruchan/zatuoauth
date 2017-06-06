class CreateOauthCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :oauth_codes do |t|
      t.string :user_id
      t.string :oauth_code
      t.datetime :expire_oauth_code

      t.timestamps
    end
  end
end
