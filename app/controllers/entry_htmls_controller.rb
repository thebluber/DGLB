class EntryHtmlsController < ApplicationController
  def show
    @entry_html = EntryHtml.find(params[:id])
    redirect_to "/htms/" + @entry_html.page_reference
  end
end
