class AddlikesCountToContributes < ActiveRecord::Migration[5.0]
  def change
    add_column :contributes, :likes_count, :integer
  end
end
