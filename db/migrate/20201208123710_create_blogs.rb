class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :Tittle
      t.string :Publisher
      t.text :Discription
      t.timestamps
    end
  end
end
