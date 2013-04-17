class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :entries, :verfasser, :namenskuerzel
  end
end
