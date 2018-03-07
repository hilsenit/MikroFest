module TitlesHelper
  def price_in_kr
    (price * 100).to_i
  end
end
