class ChangeDatatypeContentOfContributes < ActiveRecord::Migration[5.0]
  def change
    change_column :contributes, :content, :text, limit: 4294967295
  end
end
