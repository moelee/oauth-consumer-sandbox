class ChangeExpiresOnToTimestamp < ActiveRecord::Migration
  def self.up
    change_column :access_tokens, :expires_on, :datetime
  end

  def self.down
    change_column :access_tokens, :expires_on, :string
  end
end
