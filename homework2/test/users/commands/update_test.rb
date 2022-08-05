require "minitest/autorun"
require 'pry-byebug'
require_relative "../../../system/boot"

class Otus::Users::Commands::UpdateTest < Minitest::Test
  include Otus::Import[
    "users.repository",
    "users.commands.update"
  ]

  def setup
    super
    @user = repository.create(
      username: 'test100',
      first_name: 'test100',
      last_name: 'test100',
      phone: 'test100',
      email: 'test100'
    )
  end

  def test_that_user_updated
    params = {
      first_name: 'Firstname',
      last_name: 'Lastname'
    }


    update.call(params)
  end
end