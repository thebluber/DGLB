require "#{Rails.root}/app/helpers/import_entry_doc_helper"
include ImportEntryDocHelper
namespace :db do
  task :import_doc_from_html => :environment do
    Entry.transaction do
      Dir.glob('gesamt/*.html') do |file|
        import_entry(file)
      end
    end
  end
end
