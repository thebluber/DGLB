#encoding:utf-8
require "nokogiri"
namespace :db do
  task :import_xml => :environment do
    Dir.glob('gesamt/*.xml') do |file|
        # do work on files ending in .rb in the desired directory
        entry = Nokogiri::XML(open(file))
        main_text_array = []
        begin
          entry.xpath("//informaltable/following-sibling::para").each do |para|
            if para.children.length > 0
              main_text_array.push(para.children[0].text)
            end
          end
          main_text_array.shift
          #uebersetzung
          main_text = main_text_array.join("<br />")
        rescue
          log = open("error_main_text.log", "a")
          log.puts file + "\n"
          log.close
        end

        file.slice!(file.length - 3..file.length - 1)
        #page_reference
        page_reference = file + "doc"

        #parameters
        FIELDS = {"Verfasser/in         (Namenskürzel)" => :namenskuerzel, "Kennzahl des Lemmas  (z.B. 1304:1)" => :kennzahl, "Spaltenzahl (z.B. 15)" => :spaltenzahl, "Japanische Umschrift" => :japanische_umschrift, "Kanji" => :kanji, "Pali" => :pali, "Sanskrit " => :sanskrit, "Chinesisch" => :chinesisch, "Tibetisch " => :tibetisch, "Koreanisch " => :koreanisch, "Weitere Sprachen " => :weitere_sprachen, "Alternative japanische Lesungen" => :alternative_japanische_lesungen, "Schreibvarianten (Kanji + Lesungen) " => :schreibvarianten, "Dt. Übersetzung " => :deutsche_uebersetzung, "Art des Lemmas  [Ziffer eingeben]  (1 Person, 2 Tempel, 3 Werk, 4 Fachtermini, 5 geographische Bezeichnung, 6 Ereignis)" => :lemma_art, "Jahreszahlen (westl. Zeitrechnung) " => :jahreszahlen, "Quellen" => :quellen, "Literatur        (m/w)" => :literatur, "Eigene Ergänzungen" => :eigene_ergaenzungen, "Ergänzungen der Quellenangaben" => :quellen_ergaenzungen, "Ergänzungen der Literaturangaben        (m/w)" => :literatur_ergaenzungen}
        hash = Hash.new
        paras = entry.xpath("//tgroup//para")

        begin
          #0 - 5 bis titel des Lemmas, data in odd
          (0..5).each do |num|
            if paras[num].children.length > 0 && num % 2 == 1
              hash[FIELDS[paras[num - 1].children[0].text]] = paras[num].children[0].text
            end
          end
          #7 - 28 bis weitere Angaben, data in even
          (7..28).each do |num|
            if paras[num].children.length > 0 && num % 2 == 0
              hash[FIELDS[paras[num - 1].children[0].text]] = paras[num].children[0].text
            end
          end
          #30 - 33 bis Übersetzung, data in odd
          (30..33).each do |num|
            if paras[num].children.length > 0 && num % 2 == 1
              hash[FIELDS[paras[num - 1].children[0].text]] = paras[num].children[0].text
            end
          end
          #35 - 44 data in even
          (35..44).each do |num|
            if paras[num].children.length > 0 && num % 2 == 0
              hash[FIELDS[paras[num - 1].children[0].text]] = paras[num].children[0].text
            end
          end
        rescue Exception => e
          log = open("error_paras.log", "a+")
          log.puts file + "\n"
          log.puts e.to_s + "\n"
          log.puts hash.to_s + "\n"
          log.puts paras.to_s + "\n"
          log.puts "-------------------------------------------"
          log.close
        end

        puts hash
        
        if !hash.empty? || !hash[nil]

          begin
            new_entry = Entry.new(hash)
            new_entry.page_reference = page_reference
            new_entry.uebersetzung = main_text
            new_entry.user = User.find(1)

            new_entry.save
          rescue Exception => e
            log = open("error_paras.log", "a+")
            log.puts file + "\n"
            log.puts e.to_s + "\n"
            log.puts hash.to_s + "\n"
            log.puts paras.to_s + "\n"
            log.puts "-------------------------------------------"
            log.close
          end
        end
    end
  end
end

