class Yugioh::ReleasesController < ApplicationController
  before_action :set_yugioh_release, only: [:show, :edit, :update, :destroy]

  # GET /yugioh/releases
  # GET /yugioh/releases.json
  def index
    @yugioh_releases = Yugioh::Release.all
  end

  # GET /yugioh/releases/1
  # GET /yugioh/releases/1.json
  def show
  end

  # GET /yugioh/releases/new
  def new
    @yugioh_release = Yugioh::Release.new
  end

  # GET /yugioh/releases/1/edit
  def edit
  end

  # POST /yugioh/releases
  # POST /yugioh/releases.json
  def create
    @yugioh_release = Yugioh::Release.new(yugioh_release_params)

    respond_to do |format|
      if @yugioh_release.save
        format.html { redirect_to @yugioh_release, notice: 'Release was successfully created.' }
        format.json { render :show, status: :created, location: @yugioh_release }
      else
        format.html { render :new }
        format.json { render json: @yugioh_release.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yugioh/releases/1
  # PATCH/PUT /yugioh/releases/1.json
  def update
    respond_to do |format|
      if @yugioh_release.update(yugioh_release_params)
        format.html { redirect_to @yugioh_release, notice: 'Release was successfully updated.' }
        format.json { render :show, status: :ok, location: @yugioh_release }
      else
        format.html { render :edit }
        format.json { render json: @yugioh_release.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yugioh/releases/1
  # DELETE /yugioh/releases/1.json
  def destroy
    @yugioh_release.destroy
    respond_to do |format|
      format.html { redirect_to yugioh_releases_url, notice: 'Release was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yugioh_release
      @yugioh_release = Yugioh::Release.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yugioh_release_params
      params.require(:yugioh_release).permit(:print_tag, :rarity)
    end
end
