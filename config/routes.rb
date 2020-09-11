Rails.application.routes.draw do
  get 'callback', to: 'session#callback'
  get 'in', to: 'session#in'
  get 'out', to: 'session#out'

  root to: 'session#in'
end
