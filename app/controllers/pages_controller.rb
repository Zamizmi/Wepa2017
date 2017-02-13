class PagesController < ApplicationController
  before_filter :authenticate

  def secret_page
    @time = Time.now
  end

  protected

  def authenticate

    admin_accounts = { "admin" => "secret", "pekka" => "beer", "arto" => "foobar", "matti" => "ittam"}

    authenticate_or_request_with_http_basic do |username, password|
      admin_accounts[username] == password
    end
  end
end
