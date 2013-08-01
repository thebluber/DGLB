#encoding:utf-8
namespace :db do

  desc 'Fill the full text search shadow table'
  task :fill_fts_table => :environment do
    puts "Indexing Entries..."
    Entry.find_in_batches do |entries|
      Entry.transaction do
        print "."
        entries.each do |entry|
          begin 
          entry.run_callbacks(:save)
          rescue Exception => e
            file = open("fts_table_error.log", "a")
            file.puts entry.inspect
            file.puts "--------------------------------------------------------"
          end
        end
      end
    end

  end
end
