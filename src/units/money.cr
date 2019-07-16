require "http/client"
require "json"

module MoneyUnit
  extend self
  CURRENCIES = [
    "EUR",
    "CAD",
    "HKD",
    "ISK",
    "PHP",
    "DKK",
    "HUF",
    "CZK",
    "AUD",
    "RON",
    "SEK",
    "IDR",
    "INR",
    "BRL",
    "RUB",
    "HRK",
    "JPY",
    "THB",
    "CHF",
    "SGD",
    "PLN",
    "BGN",
    "TRY",
    "CNY",
    "NOK",
    "NZD",
    "ZAR",
    "USD",
    "MXN",
    "ILS",
    "GBP",
    "KRW",
    "MYR",
  ]

  def currencies_string
    return CURRENCIES.join(", ")
  end

  def currency_not_supported_error(curr)
    return "Currency '#{curr}' not supported.\n" \
           "Supported currencies: " \
           "#{currencies_string}"
  end

  class Results
    JSON.mapping(
      rates: Hash(String, Float64)
    )
  end

  def format_rates(rates)
    rates.each.reduce("") { |acc, i|
      line = "#{i[0]}  #{i[1]}\n"
      acc + line
    }
  end

  def convert(amount, currency = "USD", currencies = ["USD", "EUR", "CAD"])
    curr = currency.upcase

    return currency_not_supported_error(curr) if !CURRENCIES.includes?(curr)
    results = HTTP::Client.get "https://api.exchangeratesapi.io/latest?base=#{curr}"
    parsed = Results.from_json results.body
    rates = parsed.rates
      .select(currencies)
      .each.map { |rate| {rate[0], (rate[1] * amount.to_f64).round(2)} }
      .to_a
    format_rates(rates)
  end

  def convert_all(amount, currency)
    convert(amount, currency, CURRENCIES)
  end

  def convert_curated(amount, currency)
    curated_currencies = [
      "USD",
      "EUR",
      "CAD",
    ]
    convert(amount, currency, curated_currencies)
  end

  def convert_custom(amount, currency, mode)
    convert_currency = mode.upcase
    if !CURRENCIES.includes?(convert_currency)
      return currency_not_supported_error(convert_currency)
    end
    convert(amount, currency, [convert_currency])
  end
end
