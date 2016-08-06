class AddingAllInformationToUsuer < ActiveRecord::Migration
  def change
  		add_column :users, :last_name, :string
  		add_column :users, :full_name, :string
  		add_column :users, :password_digest, :string
  		add_column :users, :role, :string
  		add_column :users, :year, :datetime
  		add_column :users, :department, :string
  		add_column :users, :date_of_birth, :datetime
  end
end
