require_relative 'currency'

class Converter < Currency
  attr_reader :num_conv, :abbr

  def initialize
    super
    @num_conv = num_conv
    @abbr = abbr
  end

  def iso_code(abbr)
    i = @rates.select{ |el| el["Cur_Abbreviation"] == abbr }.map do |el| 
        scale = el["Cur_Scale"],
        official_rate = el["Cur_OfficialRate"] 
    end
        i[0][1] / i[0][0]
  end

  def converter_to_byn( num_conv, abbr)
    (num_conv * iso_code(abbr)).round
  end

  def self.convert(num_conv, cur_from, cur_to)
    a = Converter.new
    (num_conv * (a.cur_rate(cur_from)).join.to_f / a.iso_code(cur_to)).round(2)
  end

end

