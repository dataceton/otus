Otus::Container.register_provider(:plugins) do
  prepare do
    # require "resolve_container"
    # require 'json_render'
  end

  # start do
  #   logger = Logger.new($stdout)
  #   logger.level = Logger::WARN if target.test?

  #   register(:logger, logger)
  # end
end
