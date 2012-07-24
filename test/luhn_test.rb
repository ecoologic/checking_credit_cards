describe Luhn do

  describe :valid? do
    it "identify a valid card number" do
      CheckingCreditCards.valid_luhn?(4111111111111111).must_equal true
    end
    
    it "identify an invalid card number" do
      CheckingCreditCards.valid_luhn?(4111111111111).must_equal false
    end
  end

end
