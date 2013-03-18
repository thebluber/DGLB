require 'spec_helper'

describe "entries/show" do
  before(:each) do
    @entry = assign(:entry, stub_model(Entry,
      :verfasser => "Verfasser",
      :kennzahl => "Kennzahl",
      :spaltenzahl => "Spaltenzahl",
      :japanische_umschrift => "Japanische Umschrift",
      :kanji => "Kanji",
      :pali => "Pali",
      :sanskrit => "Sanskrit",
      :chinesisch => "Chinesisch",
      :tibetisch => "Tibetisch",
      :koreanisch => "Koreanisch",
      :weitere_sprachen => "Weitere Sprachen",
      :alternative_japanische_lesungen => "Alternative Japanische Lesungen",
      :schreibvarianten => "Schreibvarianten",
      :deutsche_uebersetzung => "Deutsche Uebersetzung",
      :lemma_art => "Lemma Art",
      :jahreszahlen => "Jahreszahlen",
      :uebersetzung => "MyText",
      :quellen => "MyText",
      :literatur => "MyText",
      :eigene_ergaenzungen => "MyText",
      :quellen_ergaenzungen => "MyText",
      :literatur_ergaenzungen => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Verfasser/)
    rendered.should match(/Kennzahl/)
    rendered.should match(/Spaltenzahl/)
    rendered.should match(/Japanische Umschrift/)
    rendered.should match(/Kanji/)
    rendered.should match(/Pali/)
    rendered.should match(/Sanskrit/)
    rendered.should match(/Chinesisch/)
    rendered.should match(/Tibetisch/)
    rendered.should match(/Koreanisch/)
    rendered.should match(/Weitere Sprachen/)
    rendered.should match(/Alternative Japanische Lesungen/)
    rendered.should match(/Schreibvarianten/)
    rendered.should match(/Deutsche Uebersetzung/)
    rendered.should match(/Lemma Art/)
    rendered.should match(/Jahreszahlen/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
