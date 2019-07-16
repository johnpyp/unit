[![Unit](/convert-button.png)](https://github.com/johnpyp/unit)

# Unit

Unit is a cli tool for doing different unit conversions.

Currently supported units:

- money

## Installation (not yet implemented)

1. Download the latest binary from the releases tab
2. `./unit --help`

## Installation from source

Requirements:

- crystal
- shards

1. `git clone https://github.com/johnpyp/unit`
2. `cd unit`
3. `shards install`
4. `crystall build --release src/unit.cr`
5. `./unit --help`

## Usage

```sh
$ unit money 10 usd # same as unit money 10 usd -m normal

USD 10.0
EUR 9.01
CAD 14.02

$ unit money 10 usd --mode all

USD 10.0
EUR 9.01
CAD 14.02
HKD 78.10
PHP 508.9
HUF 2903.41
...

$ unit money 10 eur -m usd # -m is an alias for --mode

EUR 11.22
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/johnpyp/unit/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [johnpyp](https://github.com/johnpyp) - creator and maintainer
