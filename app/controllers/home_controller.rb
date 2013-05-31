class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    params[:search] = nil if params[:search] and params[:search].strip == "" 
    @page = params[:page] || 0
    @entries = (params[:search] ? Entry.search(params[:search]) : Entry).order("japanische_umschrift").page(@page)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entries }
    end
  end


end
