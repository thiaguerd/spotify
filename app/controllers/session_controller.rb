class SessionController < ApplicationController
  def in; end

  def out
    session.clear
    redirect_to root_path
  end

  def callback
    options = params.clone
    options[:request] = request
    generated_token = Spotify::Api::Token.new.gen(options)
    token = Token.build(generated_token)
    session[:user] = User.build(token).id
    redirect_to root_path
  end
end
