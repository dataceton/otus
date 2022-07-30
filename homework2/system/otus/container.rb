require "bundler/setup"
require "dry/system/container"
require "zeitwerk"
require "pry-byebug"

module Otus
  class Container < Dry::System::Container
    use :env, inferrer: -> { ENV.fetch("RACK_ENV", :development).to_sym }
    use :zeitwerk, debug: true
  
    configure do |config|
      config.root = File.expand_path "../..", __dir__

      config.component_dirs.namespaces.add "otus", key: nil
      config.component_dirs.add "lib"
    end
  end

  Import = Container.injector
end