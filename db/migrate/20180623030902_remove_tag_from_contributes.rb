class RemoveTagFromContributes < ActiveRecord::Migration[5.0]
  def change
    remove_column :contributes, :tag, :string
  end
end
