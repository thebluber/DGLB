require 'spec_helper'

describe "entries/new" do
  before(:each) do
    assign(:entry, stub_model(Entry,
      :verfasser => "MyString",
      :kennzahl => "MyString",
      :spaltenzahl => "MyString",
      :japanische_umschrift => "MyString",
      :kanji => "MyString",
      :pali => "MyString",
      :sanskrit => "MyString",
      :chinesisch => "MyString",
      :tibetisch => "MyString",
      :koreanisch => "MyString",
      :weitere_sprachen => "MyString",
      :alternative_japanische_lesungen => "MyString",
      :schreibvarianten => "MyString",
      :deutsche_uebersetzung => "MyString",
      :lemma_art => "MyString",
      :jahreszahlen => "MyString",
      :uebersetzung => "MyText",
      :quellen => "MyText",
      :literatur => "MyText",
      :eigene_ergaenzungen => "MyText",
      :quellen_ergaenzungen => "MyText",
      :literatur_ergaenzungen => "MyText"
    ).as_new_record)
  end

  it "renders new entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => entries_path, :method => "post" do
      assert_select "input#entry_verfasser", :name => "entry[verfasser]"
      assert_select "input#entry_kennzahl", :name => "entry[kennzahl]"
      assert_select "input#entry_spaltenzahl", :name => "entry[spaltenzahl]"
      assert_select "input#entry_japanische_umschrift", :name => "entry[japanische_umschrift]"
      assert_select "input#entry_kanji", :name => "entry[kanji]"
      assert_select "input#entry_pali", :name => "entry[pali]"
      assert_select "input#entry_sanskrit", :name => "entry[sanskrit]"
      assert_select "input#entry_chinesisch", :name => "entry[chinesisch]"
      assert_select "input#entry_tibetisch", :name => "entry[tibetisch]"
      assert_select "input#entry_koreanisch", :name => "entry[koreanisch]"
      assert_select "input#entry_weitere_sprachen", :name => "entry[weitere_sprachen]"
      assert_select "input#entry_alternative_japanische_lesungen", :name => "entry[alternative_japanische_lesungen]"
      assert_select "input#entry_schreibvarianten", :name => "entry[schreibvarianten]"
      assert_select "input#entry_deutsche_uebersetzung", :name => "entry[deutsche_uebersetzung]"
      assert_select "input#entry_lemma_art", :name => "entry[lemma_art]"
      assert_select "input#entry_jahreszahlen", :name => "entry[jahreszahlen]"
      assert_select "textarea#entry_uebersetzung", :name => "entry[uebersetzung]"
      assert_select "textarea#entry_quellen", :name => "entry[quellen]"
      assert_select "textarea#entry_literatur", :name => "entry[literatur]"
      assert_select "textarea#entry_eigene_ergaenzungen", :name => "entry[eigene_ergaenzungen]"
      assert_select "textarea#entry_quellen_ergaenzungen", :name => "entry[quellen_ergaenzungen]"
      assert_select "textarea#entry_literatur_ergaenzungen", :name => "entry[literatur_ergaenzungen]"
    end
  end
end
