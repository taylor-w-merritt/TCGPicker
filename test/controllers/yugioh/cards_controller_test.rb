require 'test_helper'

class Yugioh::CardsControllerTest < ActionController::TestCase
  setup do
    @yugioh_card = yugioh_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yugioh_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yugioh_card" do
    assert_difference('Yugioh::Card.count') do
      post :create, yugioh_card: { attack: @yugioh_card.attack, card_type: @yugioh_card.card_type, defense: @yugioh_card.defense, element: @yugioh_card.element, level: @yugioh_card.level, name: @yugioh_card.name, property: @yugioh_card.property, text: @yugioh_card.text, type: @yugioh_card.type }
    end

    assert_redirected_to yugioh_card_path(assigns(:yugioh_card))
  end

  test "should show yugioh_card" do
    get :show, id: @yugioh_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yugioh_card
    assert_response :success
  end

  test "should update yugioh_card" do
    patch :update, id: @yugioh_card, yugioh_card: { attack: @yugioh_card.attack, card_type: @yugioh_card.card_type, defense: @yugioh_card.defense, element: @yugioh_card.element, level: @yugioh_card.level, name: @yugioh_card.name, property: @yugioh_card.property, text: @yugioh_card.text, type: @yugioh_card.type }
    assert_redirected_to yugioh_card_path(assigns(:yugioh_card))
  end

  test "should destroy yugioh_card" do
    assert_difference('Yugioh::Card.count', -1) do
      delete :destroy, id: @yugioh_card
    end

    assert_redirected_to yugioh_cards_path
  end
end
