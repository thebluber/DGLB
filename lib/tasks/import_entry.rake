namespace :db do
  task :import_entry_from_doc_and_html => :environment do
    Entry.transaction do
      ImportEntryService.run
    end
  end
end
