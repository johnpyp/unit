require "clim"
require "./units/*"
require "./parsers"

module Unit
  VERSION = "0.1.0"

  class UnitCli < Clim
    main do
      desc "Unit conversions and information"
      usage "unit [unit | type] [arguments]"
      version "version #{Unit::VERSION}", short: "-v"
      run do |opts, args|
        if args.empty?
          return puts opts.help_string
        end
        puts args
      end
      sub "money" do
        desc "Convert money between different currencies"
        usage "unit money [amount] [unit]"
        option "-m MODE", "--mode MODE",
          type: String,
          desc: "Currency mode: normal, all, custom (-m EUR, -m CAD, etc.)",
          default: "normal"
        run do |opts, args|
          if args.empty? || !args[0].to_i64? || !args[1]?
            return puts opts.help_string
          end

          Parsers.parse_money(args, opts.mode)
        end
      end
    end
  end

  UnitCli.start(ARGV)
end
