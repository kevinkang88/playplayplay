class DashboardController < ApplicationController
  # later customize this so that it brings them to root page not sign in page
  before_filter :auth_user

  def index

  end

end
