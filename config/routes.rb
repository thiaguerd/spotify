Rails.application.routes.draw do
  get 'session/in'
  get 'session/out'

  root to: 'session#in'
end
