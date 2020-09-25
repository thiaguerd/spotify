require 'rails_helper'
RSpec.describe 'session/in.slim', type: :view do
  context 'when logged' do
    before { allow(view).to receive_messages(current_user: create(:user)) }

    it 'have link to in' do
      render template: 'layouts/application'
      url_in = CGI.escapeHTML(Spotify::Api.url_in(CustomRequest.new))
      expect(rendered).not_to match(Regexp.escape(url_in))
    end

    it 'dont show out url' do
      render template: 'layouts/application'
      expect(rendered).to match(Regexp.escape(out_path))
    end
  end
end
