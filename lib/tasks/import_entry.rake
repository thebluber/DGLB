require "#{Rails.root}/app/helpers/import_entry_helper"
include ImportEntryHelper
namespace :db do
  task :import_entry_from_doc_and_html => :environment do
    Entry.transaction do
      run
    end
  end
end
