class ImportEntryHtmlService
  def self.import_entry file
    log = open("error_log_html", "a")
    begin
      entry = EntryHtml.new
      entry.update_attribute(:page_reference, file[/\/.+/].gsub("/", ""))
      puts entry.page_reference
      kennzahl_parts = entry.page_reference.split("_")
      kennzahl = kennzahl_parts[0].gsub("x", "").to_i.to_s + ":" + kennzahl_parts[1].to_i.to_s
      kennzahl += "a" if kennzahl_parts[1].include? "a"
      entry.update_attribute(:kennzahl, kennzahl)

      text = Nokogiri::HTML(open(file)).text.strip
      entry.update_attribute(:uebersetzung, text)
    rescue Exception => e
      log.puts e
      log.puts file
    end

    log.close
  end
end
