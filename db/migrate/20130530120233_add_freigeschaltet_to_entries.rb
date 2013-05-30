class AddFreigeschaltetToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :freigeschaltet, :boolean, default: false
  end
end
