class CreateContributesToTags < ActiveRecord::Migration[5.0]
  def change
    create_table :contributes_to_tags do |t|
      t.references :contribute, foreign_key: true
      t.references :contribute_tag, foreign_key: true
      t.timestamps
    end
  end
end
