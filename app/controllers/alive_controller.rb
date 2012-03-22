class AliveController < ApplicationController
  respond_to :json

  def index
    render :json => { :success => true }
  end
end
