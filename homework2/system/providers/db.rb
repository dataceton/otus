Otus::Container.register_provider(:db) do
  prepare do
    require "sequel/core"
  end

  start do
    target.start :logger
    target.start :environments

    db = Sequel.connect ENV.delete("DATABASE_URL")
    db.loggers << target[:logger]

    register("persistance.db", db)
  end
end
