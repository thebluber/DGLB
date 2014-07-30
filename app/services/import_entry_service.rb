require "nokogiri"
class ImportEntryService
  def self.run
    lemalist = open("lemalist.tab").read.split("\r").map{|l| l.split("\t")}
    Entry.transaction do
      lemalist.each do |lema|
        new_entry = Hash.new

        if lema.length >= 4
          kennzahl = lema[1].split(/[,.]/)
          japanese = lema[2].split(/[\s]/)
          new_entry[:kennzahl] = kennzahl.join(":")

          if japanese.length == 3
            new_entry[:kanji] = japanese[2]
            new_entry[:japanische_umschrift] = japanese[0] + " " + japanese[1]
          elsif japanese[1]
            new_entry[:kanji] = japanese[1]
            new_entry[:japanische_umschrift] = japanese[0]
          else
            new_entry[:japanische_umschrift] = japanese[0]
          end

          if lema[3] != ""
            other = lema[3].split(",")
            if other.length == 1
              new_entry[:sanskrit] = lema[3]
            else
              new_entry[:weitere_sprachen] = lema[3]
            end
          end
          if lema[4] && lema[4] != ""
            new_entry[:spaltenzahl] = lema[4].match(/\(([0-9]+)\)/)[1]
          end
        end

        docs = EntryDoc.where(kennzahl: new_entry[:kennzahl])
        htmls = EntryHtml.where(kennzahl: new_entry[:kennzahl])

        puts "EntryDocs: " + new_entry[:kennzahl] if docs.count > 1
        raise "EntryHtmls: " + new_entry[:kennzahl] if htmls.count > 1

        fields = [ :namenskuerzel,
                   :spaltenzahl,
                   :japanische_umschrift,
                   :kanji,
                   :pali,
                   :sanskrit,
                   :chinesisch,
                   :tibetisch,
                   :koreanisch,
                   :weitere_sprachen,
                   :alternative_japanische_lesungen,
                   :schreibvarianten,
                   :deutsche_uebersetzung,
                   :lemma_art,
                   :jahreszahlen,
                   :uebersetzung,
                   :literatur,
                   :quellen,
                   :eigene_ergaenzungen,
                   :literatur_ergaenzungen,
                   :quellen_ergaenzungen
        ]
        entry = Entry.create(new_entry)

        unless htmls.empty?
          html = htmls.first
          unless html.uebersetzung.blank?
            entry.uebersetzung = html.uebersetzung
          end
          puts "Failed to save Entry uebersetzung from EntryHtml: " + html.id.to_s if !entry.save
          html.entry = entry
          html.save
        end

        unless docs.empty?
          doc = docs.first
          fields.each do |attr|
            unless doc[attr].blank?
              entry[attr] = doc[attr]
            end
          end
          puts "Failed to save Entry from EntryDoc: " + doc.id.to_s if !entry.save

          #There could be more than 1 entry_doc with the same kennzahl
          #i.e. m1060_06a.html and m1060_06.html
          #they should be both linked
          docs.each do |doc|
            doc.entry = entry
            doc.save
          end
        end
      end
    end
  end
end
