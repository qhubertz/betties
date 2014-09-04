class BettiesController < ApplicationController
  before_action :set_betty, only: [:show, :edit, :update, :destroy]

  def index
    @betties = Betty.all
  end

  def show
  end

  def new
    @betty = Betty.new
  end

  def edit
  end

  def create
    @betty = Betty.new(betty_params)

    if @betty.save
     redirect_to @betty, notice: 'Betty was successfully created.'
    else
     render action: 'new' 
    end
  end

  def update
    if @betty.update(betty_params)
      redirect_to @betty, notice: 'Betty was successfully updated.'
    else
     render action: 'edit'
    end
  end

  def destroy
    @betty.destroy
    redirect_to betties_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_betty
      @betty = Betty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def betty_params
      params.require(:betty).permit(:description)
    end
end
