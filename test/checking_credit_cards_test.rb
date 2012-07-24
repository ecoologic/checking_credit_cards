# http://docs.seattlerb.org/minitest/
require 'minitest/autorun'

describe CheckingCreditCards do

  describe :present_all do
    it "confirms a valid visa card" do
      # TODO: improve this test with more entries
      CheckingCreditCards.present_all([4111111111111111]).first.must_match(/^visa(.*)\(valid\)$/)
    end
  end

end
