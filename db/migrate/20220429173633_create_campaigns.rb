class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :image
      t.integer :percentage_raised, default: 0
      t.float :target_amount
      t.string :sector
      t.string :country
      t.float :investment_multiple
      t.float :total_amount_raised, default: 0.0
      t.string :currency, default: "GBP"

      t.timestamps
    end
  end
end
