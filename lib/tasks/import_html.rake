#encoding:utf-8
def to_filename(kennzahl_array)
  first = kennzahl_array[0]
  last = kennzahl_array[1]

  if first.length < 4
    zero = "0"
    (1..(4 - first.length)).each do |num|
      first = zero + first
    end
  end

  if last.to_i < 10
    last = "0" + last
  end
  "x#{first}_#{last}.htm"
end

namespace :db do
  task :import_html=> :environment do
    lemalist = open("lemalist.tab").read.split("\r").map{|l| l.split("\t")}
    index = 0
    not_parsing = 0
    EntryHtml.transaction do
      lemalist.each do |lema|
        entry_html = EntryHtml.new
        if lema.length >= 4
          entry = Hash.new
          kennzahl = lema[1].split(/[,.]/)
          japanese = lema[2].split(/[\s]/)
          entry[:kennzahl] = kennzahl.join(":")

          if japanese.length == 3
            entry[:kanji] = japanese[2]
            entry[:japanische_umschrift] = japanese[0] + " " + japanese[1]
          elsif japanese[1]
            entry[:kanji] = japanese[1]
            entry[:japanische_umschrift] = japanese[0]
          else
            entry[:japanische_umschrift] = japanese[0]
          end

          if lema[3] != ""
            other = lema[3].split(",")
            if other.length == 1
              entry[:sanskrit] = lema[3]
            else
              entry[:weitere_sprachen] = lema[3]
            end
          end
          if lema[4] && lema[4] != ""
            entry[:spaltenzahl] = lema[4].match(/\(([0-9]+)\)/)[1]
          end
          begin
            entry_html.update_attributes(entry)
            if lema[5] && lema[5] == "Link zu HTML-Datei"
              entry_html.page_reference = to_filename(kennzahl)
              puts entry_html.page_reference
              file = open("gesamt/#{entry_html.page_reference}").read
              entry_html.uebersetzung = file
            end
            entry_html.save
          rescue Exception => e
            not_parsing += 1
            file = open("error_log_html", "a")
            file.puts index
            file.puts entry_html.attributes.to_s
            file.puts e
            file.puts "---------------------------"
            file.close
          end
          index += 1
          puts "total: " + index.to_s
          puts "not_parsing: " + not_parsing.to_s
        end
      end
    end
  end
end
      
