class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :verfasser
      t.string :kennzahl
      t.string :spaltenzahl
      t.string :japanische_umschrift
      t.string :kanji
      t.string :pali
      t.string :sanskrit
      t.string :chinesisch
      t.string :tibetisch
      t.string :koreanisch
      t.string :weitere_sprachen
      t.string :alternative_japanische_lesungen
      t.string :schreibvarianten
      t.string :deutsche_uebersetzung
      t.string :lemma_art
      t.string :jahreszahlen
      t.text :uebersetzung
      t.text :quellen
      t.text :literatur
      t.text :eigene_ergaenzungen
      t.text :quellen_ergaenzungen
      t.text :literatur_ergaenzungen

      t.timestamps
    end
  end
end
