require "bundler/setup"
require "dry/system/container"
require "zeitwerk"

module Otus
  class Container < Dry::System::Container
    use :env, inferrer: -> { ENV.fetch("RACK_ENV", :development).to_sym }
    use :zeitwerk, debug: true

    configure do |config|
      config.root = File.expand_path "../..", __dir__

      config.inflector = Dry::Inflector.new do |inflections|
        inflections.acronym("JSON")
      end

      config.component_dirs.auto_register = proc do |component|
        !component.identifier.include?("entities") || component.identifier.include?("types")
      end

      config.component_dirs.add "lib" do |dir|
        dir.namespaces.add "otus", key: nil
      end

      # config.component_dirs.add "system/roda_plugins" do |dir|
      #   dir.auto_register = false
      # end
    end

    class << self
      %i[production development test].each do |environment|
        define_method("#{environment}?") do
          environment == env
        end
      end
    end
  end

  Import = Container.injector
end
