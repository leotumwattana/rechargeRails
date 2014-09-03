class AddInsideToCardHolders < ActiveRecord::Migration
  def change
    add_column :card_holders, :inside, :boolean
  end
end
