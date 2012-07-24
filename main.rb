puts 'Checking Credit Cards'

Dir['./app/*.rb', './test/*.rb'].each(&method(:require))
# puts CardTypeDetector.card_type_for 4111111111111111

puts 'bye'
