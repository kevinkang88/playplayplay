class TracksController < ApplicationController
  before_filter :authenticate_user!

  def search
    p "*" * 100
    puts params[:returnedData]
    p "*" * 100

  end
end
