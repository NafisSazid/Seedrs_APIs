class Campaign < ApplicationRecord
  validates :name, :image, :percentage_raised, :target_amount, :sector, :country, :investment_multiple,
            :total_amount_raised, :currency, presence: true
  has_many :investment
end
