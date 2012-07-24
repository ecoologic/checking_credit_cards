# http://docs.seattlerb.org/minitest/
require 'minitest/autorun'

describe CheckingCreditCards do

  describe :present_all do
    it "confirms a valid visa card" do
      # TODO: improve this test with more entries
      CheckingCreditCards.present_all([4111111111111111]).first.must_match(/^Visa(.*)\(valid\)$/)
    end

    it "confirms an invalid visa card" do
      CheckingCreditCards.present_all([4111111111111]).first.must_match(/^Visa(.*)\(invalid\)$/)
    end

    it "confirms an ivalid  mastercard with spaces" do
      CheckingCreditCards.present_all(['5105 1051 0510 5106']).first.must_match(/^MasterCard(.*)\(invalid\)$/)
    end

  end

end
