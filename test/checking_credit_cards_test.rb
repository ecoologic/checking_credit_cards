# http://docs.seattlerb.org/minitest/
require 'minitest/autorun'

describe CheckingCreditCards do

  describe :present_all do
    it "should confirm two valid cards" do
      actual = CheckingCreditCards.present_all [4111111111111111, '51051 05105105100']
      actual.first.must_match(/^Visa(.*)\(valid\)$/)
      actual.last.must_match(/^(.*)^MasterCard(.*)\(valid\)$/)
    end

    it "confirms an invalid visa card" do
      CheckingCreditCards.present_all([4111111111111]).first.must_match(/^Visa(.*)\(invalid\)$/)
    end

    it "confirms an ivalid  mastercard with spaces" do
      CheckingCreditCards.present_all(['5105 1051 0510 5106']).first.must_match(/^MasterCard(.*)\(invalid\)$/)
    end

    it "valid/invalid column is always in line" do
      CheckingCreditCards.present_all(['5105 1051 0510 5106']).first[32].must_equal '('
    end
  end

  describe :present do
    it "should present even a very long number" do
      # FIXME: should fail, but errors out
      proc { CheckingCreditCards.send(:present, :mc, 41111111111111111111111111.to_s, false) }.must_be_silent
    end
  end


end
