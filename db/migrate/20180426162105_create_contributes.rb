class CreateContributes < ActiveRecord::Migration[5.0]
  def change
    create_table :contributes do |t|
      t.string :image
      t.string :content
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
