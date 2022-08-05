Otus::Container.register_provider(:validation) do
  prepare do
    require "dry/validation"
  end

  start do
    Dry::Validation.load_extensions(:monads)
  end
end
