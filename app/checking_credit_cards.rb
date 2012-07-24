# https://gist.github.com/6ca21baf77a47d72b23c
class CheckingCreditCards

  LAST_COLUMN_POSITION = 30

  def console
    # TODO
  end

  # present a list of credit card numbers
  # see present
  def self.present_all(numbers)
    numbers.map{|n| n.to_s.gsub ' ', '' }.map do |card_number| # TODO: move gsub in present
      card_type = CardTypeDetector.card_type_for card_number
      valid     = Luhn.valid? card_number
      present card_type, card_number, valid
    end
  end


  def self.present(card, number, valid)
    spaces = ' ' * spaces_for(card, number)
    "#{card}: #{number}#{spaces}(#{'in' unless valid}valid)"
  end


  def self.spaces_for(card, number)
    LAST_COLUMN_POSITION - card.length - number.length
  end
  private_class_method :spaces_for

end
