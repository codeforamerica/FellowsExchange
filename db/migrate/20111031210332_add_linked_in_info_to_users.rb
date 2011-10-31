class AddLinkedInInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :access_token, :string
    add_column :users, :access_secret, :string
    add_column :users, :linked_in_id, :string
    add_column :users, :skills, :string
    add_column :users, :interests, :string
  end
end
