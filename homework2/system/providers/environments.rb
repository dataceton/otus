Otus::Container.register_provider(:environments) do
  start do
    if %i[development test].include?(target.env)
      require 'dotenv'

      Dotenv.load('.env', ".env.#{target.env}")
    end
  end
end