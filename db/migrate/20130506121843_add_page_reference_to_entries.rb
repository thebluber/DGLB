class AddPageReferenceToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :page_reference, :string
  end
end
