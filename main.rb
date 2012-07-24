puts 'Checking Credit Cards'

Dir['./app/*.rb'].each(&method(:require))

CheckingCreditCards.present_all(
[  4111111111111111  ,
  4111111111111      ,
  4012888888881881   ,
  378282246310005    ,
  6011111111111117   ,
  5105105105105100   ,
  '5105 1051 0510 5106',
  9111111111111111
]).each {|line| puts line}

puts 'bye'
