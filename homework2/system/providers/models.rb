Otus::Container.register_provider(:models) do
  prepare do
    require 'sequel/model'
  end

  start do
    Sequel::Model.cache_associations = false if target.development?
    Sequel::Model.plugin :prepared_statements
  end
end