class CreateContributeTags < ActiveRecord::Migration[5.0]
  def change
    create_table :contribute_tags do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
