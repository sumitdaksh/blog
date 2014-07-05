class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body

      #this line adds an integer column called 'articale_id'.

      t.references :articale, index:true

      t.timestamps
    end
  end
end
