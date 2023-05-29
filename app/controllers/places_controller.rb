class PlacesController < ApplicationController

  def index
    @places = Place.all
    # @places = current_user.places
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @posts = Post.where({ "place_id" => @place["id"] })
  end

  # def new
  #   @place = Place.new
  # end

  def new
    if @current_user
      @place = Place.new
    else
      flash[:notice] = "Please log in or sign up to create a place."
      redirect_to signup_path
    end
  end


  def create
    @place = Place.new
    @place["name"] = params["place"]["name"]
    @place.save
    redirect_to "/places"
  end

end
