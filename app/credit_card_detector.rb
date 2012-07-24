class CardTypeDetector
  
  # credit card types grouped by number 
  # +============+=============+===============+
  # | Card Type  | Begins With | Number Length |
  # +============+=============+===============+
  # | AMEX       | 34 or 37    | 15            |
  # +------------+-------------+---------------+
  # | Discover   | 6011        | 16            |
  # +------------+-------------+---------------+
  # | MasterCard | 51-55       | 16            |
  # +------------+-------------+---------------+
  # | Visa       | 4           | 13 or 16      |
  # +------------+-------------+---------------+
  # also see: http://www.regular-expressions.info/creditcard.html
  CARD_TYPES_BY_REGEX = {
    /^3[47][0-9]{13}$/           => :amex,
    /^6011[0-9]{12}/            => :discover,
    /^5[1-5][0-9]{14}$/         => :mastercard,
    /^4[0-9]{12}(?:[0-9]{3})?$/ => :visa
  }


  # returns the corresponding credit card name
  def self.card_type_for(number)
    CARD_TYPES_BY_REGEX.each do |regex, card|
      return card if number.to_s =~ regex
    end
    :unknown
  end

end
