module Errors
  class InvalidInvestment < StandardError
    def to_s
      "Investment amount not matching with the investment multiple for the campaign"
    end
  end
end
