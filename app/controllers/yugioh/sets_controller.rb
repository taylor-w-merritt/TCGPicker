class Yugioh::SetsController < ApplicationController
  before_action :set_yugioh_set, only: [:show, :edit, :update, :destroy]

  # GET /yugioh/sets
  # GET /yugioh/sets.json
  def index
    @yugioh_sets = Yugioh::Set.all
  end

  # GET /yugioh/sets/1
  # GET /yugioh/sets/1.json
  def show
  end

  # GET /yugioh/sets/new
  def new
    @yugioh_set = Yugioh::Set.new
  end

  # GET /yugioh/sets/1/edit
  def edit
  end

  # POST /yugioh/sets
  # POST /yugioh/sets.json
  def create
    @yugioh_set = Yugioh::Set.new(yugioh_set_params)

    respond_to do |format|
      if @yugioh_set.save
        format.html { redirect_to @yugioh_set, notice: 'Set was successfully created.' }
        format.json { render :show, status: :created, location: @yugioh_set }
      else
        format.html { render :new }
        format.json { render json: @yugioh_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yugioh/sets/1
  # PATCH/PUT /yugioh/sets/1.json
  def update
    respond_to do |format|
      if @yugioh_set.update(yugioh_set_params)
        format.html { redirect_to @yugioh_set, notice: 'Set was successfully updated.' }
        format.json { render :show, status: :ok, location: @yugioh_set }
      else
        format.html { render :edit }
        format.json { render json: @yugioh_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yugioh/sets/1
  # DELETE /yugioh/sets/1.json
  def destroy
    @yugioh_set.destroy
    respond_to do |format|
      format.html { redirect_to yugioh_sets_url, notice: 'Set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yugioh_set
      @yugioh_set = Yugioh::Set.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yugioh_set_params
      params.require(:yugioh_set).permit(:name)
    end
end
