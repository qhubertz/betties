class BettiesController < ApplicationController
  before_action :set_betty, only: [:show, :edit, :update, :destroy]

  # GET /betties
  # GET /betties.json
  def index
    @betties = Betty.all
  end

  # GET /betties/1
  # GET /betties/1.json
  def show
  end

  # GET /betties/new
  def new
    @betty = Betty.new
  end

  # GET /betties/1/edit
  def edit
  end

  # POST /betties
  # POST /betties.json
  def create
    @betty = Betty.new(betty_params)

    respond_to do |format|
      if @betty.save
        format.html { redirect_to @betty, notice: 'Betty was successfully created.' }
        format.json { render :show, status: :created, location: @betty }
      else
        format.html { render :new }
        format.json { render json: @betty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /betties/1
  # PATCH/PUT /betties/1.json
  def update
    respond_to do |format|
      if @betty.update(betty_params)
        format.html { redirect_to @betty, notice: 'Betty was successfully updated.' }
        format.json { render :show, status: :ok, location: @betty }
      else
        format.html { render :edit }
        format.json { render json: @betty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /betties/1
  # DELETE /betties/1.json
  def destroy
    @betty.destroy
    respond_to do |format|
      format.html { redirect_to betties_url, notice: 'Betty was successfully destroyed.' }
      format.json { head :no_content }
    end
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
