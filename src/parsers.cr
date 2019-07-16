module Parsers
  extend self

  def parse_money(args, mode)
    amount, curr = args
    case mode
    when "normal"
      puts MoneyUnit.convert_curated(amount, curr)
    when "all"
      puts MoneyUnit.convert_all(amount, curr)
    else
      puts MoneyUnit.convert_custom(amount, curr, mode)
    end
  end
end
