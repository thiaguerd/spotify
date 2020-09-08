module ApplicationHelper
  def url_in
    Spotify::Api.url_in(request)
  end
end
