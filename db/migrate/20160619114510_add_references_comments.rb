class AddReferencesComments < ActiveRecord::Migration
  def change
  	remove_column :comments, :post_id
  	remove_column :comments, :user_id
  end
end
