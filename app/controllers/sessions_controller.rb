class SessionsController < ApplicationController
  def index
    @hours = Hour.all
    @days = Day.all 
  end

  def create
  end

  def edit
  end
end
