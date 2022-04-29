class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :image
      t.integer :percentage_raised
      t.float :target_amount
      t.string :sector
      t.string :country
      t.float :investment_multiple

      t.timestamps
    end
  end
end
