module Errors
  class InvalidInvestmentMultiple < StandardError
    def to_s
      "Investment amount not matching with the investment multiple for the campaign"
    end
  end

  class InvalidInvestment < StandardError
    def to_s
      "Investment amount is invalid"
    end
  end
end
