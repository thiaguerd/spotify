require 'rails_helper'
RSpec.describe 'session/in.slim', type: :view do
  it 'have link to in' do
    render
    url_in = CGI.escapeHTML(Spotify::Api.url_in(CustomRequest.new))
    expect(rendered).to match(Regexp.escape(url_in))
  end
end
