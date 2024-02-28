class EntriesController < ApplicationController


def new 
  @entry = Entry.new
  # render entries/new view with new Entry form
end

def show
  @entry = Entry.find_by({"id" => params["id"]})
  @entry = Place.find_by({"id" => @entry["place_id"]})

end 



  def create
    # start with a new Entry
    @entry = Entry.new
    #assign user-entered form data to Entry's columns
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["posted_on"] = Date.today
    @entry["place_id"] = params["place_id"]
    @entry.save 
    redirect_to "/places/#{@entry["place_id"]}"
    end
  end 