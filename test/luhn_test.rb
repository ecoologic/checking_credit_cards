describe Luhn do

  describe :valid? do
    it "identify a valid card number" do
      Luhn.valid?(4111111111111111).must_equal true
    end
    
    it "identify an invalid card number" do
      Luhn.valid?(4111111111111).must_equal false
    end
  end

end
