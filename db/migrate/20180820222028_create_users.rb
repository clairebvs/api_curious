class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :username
      t.string :oauth_token
      t.string :image
      t.string :nickname

      t.timestamps
    end
  end
end
