class BettiesController < ApplicationController
  before_action :set_betty, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @betties = Betty.all.order("created_at DESC")
  end

  def show
  end

  def new
    @betty = current_user.betties.build
  end

  def edit
  end

  def create
    @betty = current_user.betties.build(betty_params)

    if @betty.save
     redirect_to @betty, notice: 'Betties on.'
    else
     render action: 'new' 
    end
  end

  def update
    if @betty.update(betty_params)
      redirect_to @betty, notice: 'Betty was edited. Seems sketchy.'
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

    def correct_user
      @betty = current_user.betties.find_by(id: params[:id])
      redirect_to betties_path, notice: "You can look, but you can't touch this betty" if @betty.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def betty_params
      params.require(:betty).permit(:description, :image)
    end
end
