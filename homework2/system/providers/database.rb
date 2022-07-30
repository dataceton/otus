Otus::Container.register_provider(:database) do
  prepare do
    require 'sequel/core'
  end

  start do
    target.start :environments

    # register(:database, Sequel.connect(ENV.delete('DATABASE_URL'))
  end
end