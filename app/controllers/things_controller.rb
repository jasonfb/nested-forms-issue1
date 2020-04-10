class ThingsController < ApplicationController

  def index

  end

  def new
    @thing = Thing.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @thing = Thing.create(thing_params)

    respond_to do |format|
      if @thing.save
        format.js
      else
        flash[:alert] = "Oops, your thing could not be saved."
        format.js
      end
    end
  end

  def edit
    @thing = Thing.find(params[:id])
    respond_to do |format|
      format.js { }

    end
  end

  def destroy

  end

  def thing_params
    params.require(:thing).permit(:id, :name, :color)

  end
end
