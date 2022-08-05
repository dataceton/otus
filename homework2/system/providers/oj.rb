Otus::Container.register_provider(:oj) do
  prepare do
    require 'json'
    require 'oj'
  end

  start do
    Oj.mimic_JSON()
  end
end
