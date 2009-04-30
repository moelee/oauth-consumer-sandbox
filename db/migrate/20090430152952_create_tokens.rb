class CreateTokens < ActiveRecord::Migration
  def self.up
    create_table :access_tokens do |t|
      t.string :token
      t.string :secret
      t.text :resource_scope
      t.string :expires_on
      t.integer :user_id
    end
  end

  def self.down
    drop_table :access_tokens
  end
end
