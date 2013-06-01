class AddOrderToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :order, :string
  end
end
