class SpotsController < ApplicationController
  def index
    @q = Spot.ransack(params[:q])
    @spots = @q.result(:distinct => true).includes(:sports, :photos, :likes, :comments, :users).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@spots.where.not(:location_latitude => nil)) do |spot, marker|
      marker.lat spot.location_latitude
      marker.lng spot.location_longitude
      marker.infowindow "<h5><a href='/spots/#{spot.id}'>#{spot.created_at}</a></h5><small>#{spot.location_formatted_address}</small>"
    end

    render("spots/index.html.erb")
  end

  def show
    @comment = Comment.new
    @like = Like.new
    @photo = Photo.new
    @sport = Sport.new
    @spot = Spot.find(params[:id])

    render("spots/show.html.erb")
  end

  def new
    @spot = Spot.new

    render("spots/new.html.erb")
  end

  def create
    @spot = Spot.new

    @spot.location = params[:location]
    @spot.name = params[:name]

    save_status = @spot.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/spots/new", "/create_spot"
        redirect_to("/spots")
      else
        redirect_back(:fallback_location => "/", :notice => "Spot created successfully.")
      end
    else
      render("spots/new.html.erb")
    end
  end

  def edit
    @spot = Spot.find(params[:id])

    render("spots/edit.html.erb")
  end

  def update
    @spot = Spot.find(params[:id])

    @spot.location = params[:location]
    @spot.name = params[:name]

    save_status = @spot.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/spots/#{@spot.id}/edit", "/update_spot"
        redirect_to("/spots/#{@spot.id}", :notice => "Spot updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Spot updated successfully.")
      end
    else
      render("spots/edit.html.erb")
    end
  end

  def destroy
    @spot = Spot.find(params[:id])

    @spot.destroy

    if URI(request.referer).path == "/spots/#{@spot.id}"
      redirect_to("/", :notice => "Spot deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Spot deleted.")
    end
  end
end
