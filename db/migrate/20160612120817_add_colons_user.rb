class AddColonsUser < ActiveRecord::Migration
  def change
  	add_column :users, :email, :string, unique: true
  	add_column :users, :first_name, :string
  end
end
