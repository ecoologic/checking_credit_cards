puts 'Checking Credit Cards Tests only'

Dir['./app/*.rb', './test/*.rb'].each(&method(:require))

puts 'bye'
