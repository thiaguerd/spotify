module ApplicationHelper
  def url_in
    Spotify::Api.url_in(request)
  end

  def current_user
    User.find(session[:user]) if session[:user]
  rescue StandardError
    session.clear
    nil
  end
end
