# frozen_string_literal: true

class AdminController < ApplicationController
  http_basic_authenticate_with(
    name: ENV['USERNAME'], password: ENV['PASSWORD']
  )

  def index() end
end
