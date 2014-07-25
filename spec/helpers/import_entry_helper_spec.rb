#encoding: utf-8
require 'spec_helper'
describe ImportEntryHelper do
  class Importer
  end
  before do
    @importer = Importer.new
    @importer.extend ImportEntryHelper

    @doc = {
      namenskuerzel: 'JZ',
      kennzahl: '123:2',
      spaltenzahl: '2',
      japanische_umschrift: 'LALA',
      kanji: 'kanji',
      lemma_art: 'Person',
      uebersetzung: 'Testtesttest',
      quellen: 'lalal',
      quellen_ergaenzungen: 'blabla',
      literatur: 'Buch',
      literatur_ergaenzungen: 'papapa'
    }

    EntryDoc.create(@doc)

    #With same Kennzahl
    @html1 = {
      namenskuerzel: 'JZ',
      kennzahl: '123:2'
    }
    EntryHtml.create(@html1)

    #With different Kennzahl
    @html2 = {
      namenskuerzel: 'JZ',
      kennzahl: '321:2'
    }
    EntryHtml.create(@html2)
  end

  it 'should import entry from entry_doc and entry_html' do
    expect{
      @importer.run
    }.to change{Entry.count}.by(2)
    @doc.each do |key, val|
      expect(Entry.first[key]).to eql val
    end

    @html2.each do |key, val|
      expect(Entry.last[key]).to eql val
    end

    #should link doc to entry
    expect(EntryDoc.last.entry_id).to eql Entry.first.id

    #should link html to entry
    expect(EntryHtml.first.entry_id).to eql Entry.first.id
    expect(EntryHtml.last.entry_id).to eql Entry.last.id
  end
end
