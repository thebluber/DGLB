class AddOrderToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :romaji_order, :string
  end
end
