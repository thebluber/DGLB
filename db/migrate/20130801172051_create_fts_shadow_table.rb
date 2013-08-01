class CreateFtsShadowTable < ActiveRecord::Migration
  def up
    sql = <<-SQL_STRING
      CREATE VIRTUAL TABLE entries_fts USING fts4(#{Entry.attribute_names.map{|a| a + " TEXT"}.join(", ")});
    SQL_STRING
    ActiveRecord::Base.connection.execute sql
  end

  def down
  end
end
