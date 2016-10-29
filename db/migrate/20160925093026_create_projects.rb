class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :text
      # t.integer :category
      t.string :imageurls
      t.integer :price
      t.references :user

      t.timestamps
    end
  end
end
