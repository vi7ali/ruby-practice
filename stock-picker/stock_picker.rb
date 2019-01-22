def stock_picker(prices)
  buy_day, sell_day, best_deal = 0, 0, 0
  buy_sell_days = []
  
  prices.each do |sell|
    if prices.index(sell) != 0
      buy_arr = prices.select {|el| prices.index(el)<prices.index(sell)}
      buy_arr.each do |buy|
        if sell-buy > best_deal
          best_deal = sell-buy
          buy_sell_days.clear
          buy_sell_days.push(prices.index(buy), prices.index(sell))
        end
      end
    end
  end
  puts buy_sell_days.join(",")
end

stock_picker([17,3,6,9,15,8,6,1,10])