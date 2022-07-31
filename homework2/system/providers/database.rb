Otus::Container.register_provider(:database) do
  prepare do
    require "sequel/core"
  end

  start do
    target.start :logger
    target.start :environments

    db = Sequel.connect ENV.delete("DATABASE_URL")
    db.loggers << target[:logger]

    register(:database, db)
  end
end
