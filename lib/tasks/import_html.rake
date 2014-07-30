namespace :db do
  task :import_html=> :environment do
    File.delete("error_log_html")
    EntryHtml.transaction do
      Dir.glob('gesamt/*.htm') do |file|
        ImportEntryHtmlService.import_entry(file)
      end
    end
  end
end
