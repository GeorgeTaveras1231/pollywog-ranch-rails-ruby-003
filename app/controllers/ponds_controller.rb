class PondsController < ApplicationController

  before_action :set_pond, :except => :index


  def create
    if @pond.save
      redirect_to pond_path(@pond)
    else
      redirect_to new_pond_path
    end
  end

  def update
    
    if @pond.save
      redirect_to pond_path(@pond)
    else
      redirect_to edit_pond_path(@pond)
    end
  end

  def index
    @ponds = Pond.all
  end

  def delete
    @pond.destroy

    redirect_to ponds_path
  end

  private
    def set_pond
      @pond = if params[:id]
        Pond.find(params[:id])
      else
        Pond.new
      end
      @pond.assign_attributes(pond_params) if params[:pond]
    end

    def pond_params
      params.require(:pond).permit(:name, :water_type)
    end
end
