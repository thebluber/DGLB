#encoding: utf-8
def import html
  titles = {
    1 => "Heilsfiguren",
    2 => "Ontologie / Weltbild",
    3 => "Philosophie / Epistemologie",
    4 => "Soteriologie",
    5 => "Institutionen, Ämter, Titel",
    6 => "Lehre und Texte",
    7 => "Schulen und Richtungen",
    8 => "Rituale, Meditation"
  }
  result = Hash.new
  html.xpath("//div[preceding-sibling::h2]").each_with_index do |div, index|
    lemmata = []
    div.css('.lemma-row').each do |row|
      kennzahl = row.attributes["id"].value.gsub("lemma","").gsub("_", ":")
      puts kennzahl
      kanji = row.css("span")[0].text
      romaji = row.css("span")[1].text
      kanji = kanji.strip
      romaji = romaji.strip
      search = Entry.where(kennzahl: kennzahl)
      id = search.empty? ? "" : search.first.id
      lemmata.push([kennzahl, id, kanji, romaji])
    end
    result[titles[index + 1]] = lemmata
  end
  result
end

