class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :email
    	t.string :password_digest
    	t.string :role
    	t.string :first_name
    	t.string :last_name
    	t.string :full_name
    	t.datetime :year
    	t.string :department
    	t.datetime :birth_of_date
      t.timestamps null: false
    end
  end
end
