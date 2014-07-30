namespace :db do
  task :import_doc_from_html => :environment do
    File.delete("error_log")
    EntryDoc.transaction do
      Dir.glob('gesamt/*.html') do |file|
        ImportEntryDocService.import_entry(file)
      end
    end
  end
end
