require "roda"
require "pry-byebug"
require_relative "system/roda_plugins/json_render"
require_relative "system/roda_plugins/resolve_container"

module Otus
  class App < Roda
    plugin :all_verbs
    plugin :json_render
    plugin :json_parser
    plugin :resolve_container
    plugin :common_logger, $stdout
    plugin :error_handler do |e|
      case e
      when Users::Repository::NotFound
        response.status = 404
        request.render "error", message: e.message
      else
        response.status = 500
        request.render "error", message: e.message, data: e.backtrace
      end
    end

    include Import["users.repository"]

    route do |r|
      r.get "health" do
        r.render "success", status: "OK"
      end

      r.on "users" do
        r.post do
          r.resolve "users.commands.create" do |create_user|
            create_user.call(r.params) do |m|
              m.success do |user|
                r.render "users.show", user: user
              end

              m.failure do |result|
                response.status = 422
                r.render "fail", data: result.errors
              end
            end
          end
        end

        r.is Integer do |user_id|
          user = repository.find!(user_id)

          r.get do
            r.render "users.show", user: user
          end

          r.patch do
            r.resolve "users.commands.update" do |update_user|
              update_user.call(user, r.params) do |m|
                m.success do |user|
                  r.render "users.show", user: user
                end

                m.failure do |result|
                  response.status = 422
                  r.render "fail", data: result.errors
                end
              end
            end
          end

          r.delete do
            repository.delete(user_id)
            r.render "success"
          end
        end
      end
    end
  end
end
