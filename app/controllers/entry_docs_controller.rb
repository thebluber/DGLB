class EntryDocsController < ApplicationController
  def show
    @entry_doc = EntryDoc.find(params[:id])
    redirect_to "/docs/" + @entry_doc.page_reference.gsub("doc", "html")
  end
end
