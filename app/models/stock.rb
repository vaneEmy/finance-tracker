class Stock < ApplicationRecord
    has_many :user_stocks
    has_many :users, through: :user_stocks

    def self.find_by_ticker(ticker_symbol)
        where(ticker: ticker_symbol).first
    end

    def self.new_from_lookup(ticker_symbol)
        begin
            looked_up_stocK = StockQuote::Stock.quote(ticker_symbol)
            new(name: looked_up_stocK.company_name, ticker: looked_up_stocK.symbol, price: looked_up_stocK.calculation_price)
        rescue Exception => e
            return nil
        end
    end
end