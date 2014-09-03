Rails.application.routes.draw do

  root "card_holders#new"

  post "cardholders" => "card_holders#create"
  put "cardholders/inside/:deviceToken" => "card_holders#inside"
  put "cardholders/outside/:deviceToken" => "card_holders#outside"
  post "cardholders/:id" => "card_holders#recharge"
  get "cardholders/:id" => "card_holders#show"
  get "cardholders/:deviceToken/cardholders" => "card_holders#getcharge"
  get "cardholders" => "card_holders#index"
  get "identification" => "staffs#identification"

end