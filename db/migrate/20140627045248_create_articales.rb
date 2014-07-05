class CreateArticales < ActiveRecord::Migration
  def change
    create_table :articales do |t|
      t.string :title
      t.text :text
      t.timestamps
    end
  end
end
