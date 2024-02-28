class PlacesController < ApplicationController

  def index
    #finds all Place rows
    @places = Place.all
    # renders places/index view
  end

  def show
    # find a Place
    @place = Place.find_by({"id" => params["id"]})
    @entries = Entry.where({"place_id" => @place["id"]})
    # render companies/show view with details about Company
  end
  
  def new
    @place = Place.new
    #render places/new view with new Post form
  end
  
  def create
    # start with a new Place
    @place = Place.new
    # assign user-entered form data to Place's column
    @place["name"] = params["name"]
    #@place["title"] = params["title"] later
    #@place["description"] = params["description"] later
    #@place["posted_on"] = params["posted_on"] #check this one. can we retrieve from date posted? later
    #i dont think we need this but maybe, since its auto/not user generated?: @place["place_id"] = params["place_id"]
    @place.save
    #save post row
    redirect_to "/places"
  end 

end
