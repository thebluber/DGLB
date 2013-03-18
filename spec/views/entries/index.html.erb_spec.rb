require 'spec_helper'

describe "entries/index" do
  before(:each) do
    assign(:entries, [
      stub_model(Entry,
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
      ),
      stub_model(Entry,
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
      )
    ])
  end

  it "renders a list of entries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Verfasser".to_s, :count => 2
    assert_select "tr>td", :text => "Kennzahl".to_s, :count => 2
    assert_select "tr>td", :text => "Spaltenzahl".to_s, :count => 2
    assert_select "tr>td", :text => "Japanische Umschrift".to_s, :count => 2
    assert_select "tr>td", :text => "Kanji".to_s, :count => 2
    assert_select "tr>td", :text => "Pali".to_s, :count => 2
    assert_select "tr>td", :text => "Sanskrit".to_s, :count => 2
    assert_select "tr>td", :text => "Chinesisch".to_s, :count => 2
    assert_select "tr>td", :text => "Tibetisch".to_s, :count => 2
    assert_select "tr>td", :text => "Koreanisch".to_s, :count => 2
    assert_select "tr>td", :text => "Weitere Sprachen".to_s, :count => 2
    assert_select "tr>td", :text => "Alternative Japanische Lesungen".to_s, :count => 2
    assert_select "tr>td", :text => "Schreibvarianten".to_s, :count => 2
    assert_select "tr>td", :text => "Deutsche Uebersetzung".to_s, :count => 2
    assert_select "tr>td", :text => "Lemma Art".to_s, :count => 2
    assert_select "tr>td", :text => "Jahreszahlen".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
