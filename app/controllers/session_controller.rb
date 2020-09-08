class SessionController < ApplicationController
  def in; end

  def out
    session.clear
    redirect_to root_path
  end

  def callback; end
end
