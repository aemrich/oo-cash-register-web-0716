require 'pry'

class CashRegister

  attr_accessor :total, :discount, :items, :price_log

  def initialize(discount=0)
    @discount = discount
    @total = 0
    @items = []
    @price_log = []
  end

  def add_item(item, price, quantity=1)

    quantity.times do
      add_to_array(item)
    end

    @total += quantity * (price).to_f
    @price_log << price
  end

  def add_to_array(item)
    items << item
  end

  def apply_discount
    #binding.pry
    @total *= ((100.00-discount)/100.00)
    if discount == 0
      "There is no discount to apply."
    else
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def void_last_transaction
    @total -= @price_log[-1]
  end


end

#cash_register = CashRegister.new

#cash_register.add_item("macbook", 2000)
#cash_register.apply_discount

#binding.pry
