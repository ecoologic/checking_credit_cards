# http://docs.seattlerb.org/minitest/
require 'minitest/autorun'

describe CardTypeDetector do

  describe :card_type_for do
    it "should return visa for a valid visa number" do
      CardTypeDetector.card_type_for(4111111111111111).must_equal :visa
    end
    
    it "should return mastercard for an invalid mastercard number" do
      CardTypeDetector.card_type_for(5105105105105106).must_equal :mastercard
    end
    
    it "should return unknown for a non-credit card number" do
      CardTypeDetector.card_type_for(51051234123412341).must_equal :unknown
    end
  end


end
