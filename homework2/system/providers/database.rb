Otus::Container.register_provider(:database) do
  prepare do
    require "sequel/core"
  end

  start do
    target.start :logger
    target.start :environments

    database = Sequel.connect ENV["DATABASE_URL"]
    database.loggers << target[:logger]

    register(:database, database)
  end
end
