class Yugioh::CardsController < ApplicationController
  before_action :set_yugioh_card, only: [:show, :edit, :update, :destroy]

  # GET /yugioh/cards
  # GET /yugioh/cards.json
  def index
    @yugioh_cards = Yugioh::Card.all
  end

  # GET /yugioh/cards/1
  # GET /yugioh/cards/1.json
  def show
  end

  # GET /yugioh/cards/new
  def new
    @yugioh_card = Yugioh::Card.new
  end

  # GET /yugioh/cards/1/edit
  def edit
  end

  # POST /yugioh/cards
  # POST /yugioh/cards.json
  def create
    @yugioh_card = Yugioh::Card.new(yugioh_card_params)

    respond_to do |format|
      if @yugioh_card.save
        format.html { redirect_to @yugioh_card, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @yugioh_card }
      else
        format.html { render :new }
        format.json { render json: @yugioh_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yugioh/cards/1
  # PATCH/PUT /yugioh/cards/1.json
  def update
    respond_to do |format|
      if @yugioh_card.update(yugioh_card_params)
        format.html { redirect_to @yugioh_card, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @yugioh_card }
      else
        format.html { render :edit }
        format.json { render json: @yugioh_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yugioh/cards/1
  # DELETE /yugioh/cards/1.json
  def destroy
    @yugioh_card.destroy
    respond_to do |format|
      format.html { redirect_to yugioh_cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yugioh_card
      @yugioh_card = Yugioh::Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yugioh_card_params
      params.require(:yugioh_card).permit(:name, :text, :card_type, :type, :element, :attack, :defense, :level, :property)
    end
end
