Otus::Container.register_provider(:logger) do
  prepare do
    require "logger"
  end

  start do
    log_levels = {
      debug: Logger::DEBUG,
      info:  Logger::INFO,
      warn:  Logger::WARN,
      error: Logger::ERROR,
      fatal: Logger::FATAL
    }

    logger = Logger.new($stdout)
    if target.test?
      logger.level = Logger::FATAL
    else
      logger.level = log_levels.fetch(ENV['LOG_LEVEL']&.to_sym, Logger::UNKNOWN)
    end

    register(:logger, logger)
  end
end
