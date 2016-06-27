module CurrencyHelper
  def to_currency(number)
    number_to_currency(number, unit: "đ", delimiter: ".", format: "%n %u", precision: 0)
  end
end
