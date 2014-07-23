class CreateEntryHtmls < ActiveRecord::Migration
  def change
    create_table :entry_htmls do |t|
      t.string :namenskuerzel
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
      t.string :jahreszahl
      t.text :uebersetzung
      t.integer :entry_id
      t.string :romaji_order
      t.string :page_reference

      t.timestamps
    end
  end
end
