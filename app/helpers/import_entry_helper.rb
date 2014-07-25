require "nokogiri"
module ImportEntryHelper
  def run
    import_from_doc
    import_from_html
  end

  def import_from_doc
    attributes = [ :namenskuerzel,
                   :kennzahl,
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
                   :quellen,
                   :literatur,
                   :eigene_ergaenzungen,
                   :quellen_ergaenzungen,
                   :literatur_ergaenzungen
    ]
    EntryDoc.find_each do |doc|
      entry = Entry.new
      begin
      attributes.each do |attribute|
        entry.update_attribute(attribute, doc[attribute])
      end
      entry.save

      doc.entry = entry
      doc.save
      rescue Exception => e
        puts "EntryDoc id: " + doc.id.to_s
        puts e
        puts "=========================="
      end
    end
  end

  def import_from_html
    attributes = [ :namenskuerzel,
                   :kennzahl,
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
                   :page_reference
    ]
    EntryHtml.find_each do |html|
      linked = Entry.where(:kennzahl => html.kennzahl)
      puts html.kennzahl if linked.count > 1

      begin
        if linked.empty?
          entry = Entry.new
          attributes.each do |attribute|
            entry.update_attribute(attribute, html[attribute])
          end
          entry.save
        end
        html.entry = linked.first
        html.save
      rescue Exception => e
        puts "EntryHtml id: " + html.id.to_s
        puts e
        puts "=========================="
      end
    end
  end
end
