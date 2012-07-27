# https://gist.github.com/6ca21baf77a47d72b23c
class CheckingCreditCards

  extend Luhn, CardTypeDetector

  LAST_COLUMN_POSITION = 30

  CARD_NAMES = {
    visa:     "Visa",
    amex:     "AMEX",
    discover: "Discover",
    mc:       "MasterCard",
    unknown:  "Unknown"
  }

  def self.console
    puts "\nEnter credit card numbers, one per line, finish with an empty line"
    credit_cards = []
    until (cc = STDIN::gets.chomp) == '' do
      credit_cards << cc
    end
    CheckingCreditCards.present_all(credit_cards).each {|line| puts line}
  end

  # present a list of credit card numbers
  # see present
  def self.present_all(numbers)
    numbers.map{|n| n.to_s.gsub ' ', '' }.map do |card_number|
      begin
        card_type = card_type_for card_number
        valid     = valid_luhn? card_number
        present card_type, card_number, valid
      rescue Exception => e
        "Card number #{card_number} could not be checked because #{e.message}"
      end
    end
  end


  def self.present(card, number, valid)
    "#{CARD_NAMES[card]}: #{number}#{spaces_for card, number}(#{'in' unless valid}valid)"
  end


  # how many blank spaces to align with the last column?
  def self.spaces_for(card, number)
    spaces = LAST_COLUMN_POSITION - CARD_NAMES[card].length - number.length
    ' ' * (spaces > 1 ? spaces : 1)
  end
  private_class_method :spaces_for

end
