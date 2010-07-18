class AuthorSession < Authlogic::Session::Base
  authenticate_with Legs.author_model.to_s.underscore.downcase.camelcase.constantize 
end
