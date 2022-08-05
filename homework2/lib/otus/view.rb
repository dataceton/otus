require "tilt/jbuilder"
require "dry-view"

module Otus
  class View < Dry::View
    config.paths = [File.join(__dir__, "templates")]
    config.default_format = :json
    config.renderer_options = {view_path: File.join(__dir__, "templates")}
    config.renderer_engine_mapping = {jbuilder: ::Tilt::JbuilderTemplate}
  end
end
