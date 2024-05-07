# frozen_string_literal: true

require_relative "challange/version"

module Challange
  class Money 
    def self.calculate_change(cost, payment)
      #Conver cost and paymeny from dollars to cents
      cost_cents = (cost * 100).round
      payment_cents = (payment * 100).round

      raise ArgumentError, "Payment must be equal to or greater than cost" if payment_cents < cost_cents

      # Calculate the total change
      change = payment_cents - cost_cents

      denominations = [10000, 5000, 2000, 1000, 500, 100, 25, 10, 5, 1]

      #Calulate the number of each denomination
      change_breakdown = denominations.map do |denomination|
        count = change / denomination
        change %= denomination
        count
      end

      change_breakdown
    end
  end
end
