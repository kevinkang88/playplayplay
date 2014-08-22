class PagesController < ApplicationController
  def main
    if user_signed_in?
      redirect_to :controller=>'dashboard', :action => 'index'
    end
  end
end
