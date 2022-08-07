Otus::Container.register_provider(:macros) do
  prepare do
    require "dry-validation"
  end

  start do
    Dry::Validation.register_macro(:uniqueness) do
      table_field = key.path.root

      key.failure("must be unique") unless repository.unique?(table_field => value)
    end
  end
end
