require 'net/http'
require 'json'
require 'uri'

class Currency
  attr_reader :refreshed_at

  def initialize
    @refreshed_at = Time.now.strftime('%d/%m/%Y')
    url = 'https://www.nbrb.by/api/exrates/rates?periodicity=0'
    json = Net::HTTP.get(URI.parse(url))
    @rates = JSON.parse(json)
  end

  #название валюты
  def cur_name(abbr)
    @rates.select{ |el| el["Cur_Abbreviation"] == abbr }.map{ |el| el["Cur_Name"] }
  end
  
  #абривиатура валюты
  def cur_abbr(name)
    @rates.select{ |el| el["Cur_Name"] == name }.map{ |el| el["Cur_Abbreviation"] }
  end

  #курс валюты
  def cur_rate(abbr)
    @rates.select{ |el| el["Cur_Abbreviation"] == abbr }.map{ |el| el["Cur_OfficialRate"] }
  end

  #номинал валюты
  def cur_scale(abbr)
    @rates.select{ |el| el["Cur_Abbreviation"] == abbr }.map{ |el| el["Cur_Scale"] }
  end

  def name(name)
    n = @rates.select{ |el| el["Cur_Name"] == name }.map do |el| 
       abbreviation = el["Cur_Abbreviation"],
       scale = el["Cur_Scale"],
       official_rate = el["Cur_OfficialRate"]               
    end
  end

end



