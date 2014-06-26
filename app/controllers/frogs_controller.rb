class FrogsController < ApplicationController

  def index
    @frogs = Frog.all

    respond_to do |format|
      format.html
      format.json
    end
  end

  def show 
    @frog = Frog.find(params[:id])
  end

  def new
    @frog = Frog.new
    @ponds = Pond.all
  end

  def create
    @frog = Frog.new(frog_params)
    if @frog.save
      redirect_to frog_path(@frog)#, notice: "You just made a frog!"
    else
      redirect_to new_frog_path
    end
  end

  def edit
    @frog = Frog.find(params[:id])
    @ponds = Pond.all
  end

  def update
    @frog = Frog.find(params[:id])
    @frog.assign_attributes(frog_params)
    if @frog.save
      redirect_to frog_path(@frog)
    else
      redirect_to edit_frog_path(@frog)#, notice: "Something went wrong..."
    end
  end


  def destroy
    @frog = Frog.find(params[:id])
    @frog.destroy
    redirect_to frogs_path
  end

  private

    def frog_params
      params.require(:frog).permit(:name, :color, :pond_id)
    end

end
