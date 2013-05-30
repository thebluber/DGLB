class Entry < ActiveRecord::Base
  has_paper_trail
  belongs_to :user
  has_many :comments
  attr_accessible :alternative_japanische_lesungen, :chinesisch, :deutsche_uebersetzung, :eigene_ergaenzungen, :jahreszahlen, :japanische_umschrift, :kanji, :kennzahl, :koreanisch, :lemma_art, :literatur, :literatur_ergaenzungen, :pali, :quellen, :quellen_ergaenzungen, :sanskrit, :schreibvarianten, :spaltenzahl, :tibetisch, :uebersetzung, :namenskuerzel, :weitere_sprachen, :freigeschaltet

  def self.search(query)
    Entry.where("japanische_umschrift LIKE ? OR kanji LIKE ? OR namenskuerzel = ? OR kennzahl = ?", "%#{query}%", "%#{query}%", "#{query}", "#{query}")
  end
end
