require "bundler/setup"
require "dry/system/container"
require "zeitwerk"

module Otus
  class Container < Dry::System::Container
    use :env, inferrer: -> { ENV.fetch("RACK_ENV", :development).to_sym }
    use :zeitwerk, debug: true

    configure do |config|
      config.root = File.expand_path "../..", __dir__

      config.component_dirs.namespaces.add "otus", key: nil
      config.component_dirs.add "lib"
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
