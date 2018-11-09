class Stock < ApplicationRecord
    def self.new_from_lookup(ticker_symbol)
        looked_up_stocK = StockQuote::Stock.quote(ticker_symbol)
        new(name: looked_up_stocK.company_name, ticker: looked_up_stocK.symbol, price: looked_up_stocK.open)
    end
end