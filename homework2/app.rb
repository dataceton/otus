require "roda"

module Otus
  class App < Roda
    plugin :json

    route do |r|
      r.get "health" do
        {status: "OK"}
      end
    end
  end
end
