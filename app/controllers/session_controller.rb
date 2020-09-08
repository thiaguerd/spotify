class SessionController < ApplicationController
  def in; end

  def out
    session.clear
  end

  def callback; end

end
