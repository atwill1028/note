class CreateContributeLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :contribute_likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :contribute, null: false, foreign_key: true
      t.timestamps
    end
  end
end
