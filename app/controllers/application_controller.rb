class ApplicationController < ActionController::Base
  acts_as_token_authentication_handler_for User
  include Pundit
end
