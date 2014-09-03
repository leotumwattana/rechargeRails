class CreateCardHolders < ActiveRecord::Migration
  def change
    create_table :card_holders do |t|
      t.string :name
      t.string :email
      t.integer :currentCharge
      t.string :deviceToken

      t.timestamps
    end
  end
end
