Rails.application.routes.draw do |map|
  map.resources Legs.post_model.to_s.pluralize, :controller => 'legs/posts'
  root :to => 'legs/posts#index', :via => 'get'
end
