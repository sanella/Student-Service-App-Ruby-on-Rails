class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
    	t.string :name
    	t.integer :etcs
    	t.datetime :year
      t.timestamps null: false
    end
  end
end
