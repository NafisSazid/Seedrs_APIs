class CreateInvestments < ActiveRecord::Migration[7.0]
  def change
    create_table :investments do |t|
      t.float :amount
      t.references :campaign
      t.timestamps
    end
  end
end
