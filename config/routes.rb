Rails.application.routes.draw do
  get 'callback', to: 'session#callback'
  get 'session/in'
  get 'session/out'

  root to: 'session#in'
end
