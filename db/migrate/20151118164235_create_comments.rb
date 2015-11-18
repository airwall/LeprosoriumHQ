class CreateComments < ActiveRecord::Migration
  def change
  	create_table :clients do |t|
  		t.text :name
  		t.text :comment
  		  		
  		t.timestamps null: false
  	end
  end
end
