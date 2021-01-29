a = Converter.new
b = Currency.new
puts "Итого на дату: #{b.refreshed_at}"
puts "конвертация равна: #{a.converter_to_byn(15000,'RUB')} белорусских рублей"
puts Converter.convert(100, 'EUR', 'RUB')