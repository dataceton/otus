Otus::Container.register_provider(:logger) do
  prepare do
    require 'logger'
  end

  start do
    logger = Logger.new($stdout)
    logger.level = Logger::WARN if target.test?

    register(:logger, logger)
  end
end