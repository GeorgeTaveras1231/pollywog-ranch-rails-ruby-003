class TadpolesController < ApplicationController
  before_action :set_tadpole, :except => [:index]

  def new
    @frog = Frog.find(params[:frog_id])
  end

  def create
    if @tadpole.save
      redirect_to tadpoles_path
    else
      redirect_to new_tadpoles_path
    end
  end

  def update
    if @tadpole.save
      redirect_to tadpoles_path
    else
      redirect_to edit_tadpoles_path
    end
  end

  def index
    @tadpoles = Tadpole.all
  end

  def evolve
    @frog = @tadpole.evolve
    if @frog
      redirect_to frog_path(@frog)
    else
      redirect_to tadpole_path(@tadpole)
    end
  end


  private

    def set_tadpole
      @tadpole = if params[:id]
        Tadpole.find(params[:id])
      elsif params[:tadpole_id]
        Tadpole.find(params[:tadpole_id])
      else
        Tadpole.new
      end

      @tadpole.assign_attributes(tadpole_params) if params[:tadpole]
    end

    def tadpole_params
      params.require(:tadpole).permit(:name, :color, :frog_id)
    end

end
