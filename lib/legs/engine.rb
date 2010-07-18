module Legs
  class Engine < Rails::Engine
    config.app_middleware.use '::ActionDispatch::Static', Legs.public_path unless ::Rails.env.production?
    initializer 'legs.copy_static_files_to_web_server_document_root' do
      Legs.copy_static_files_to_web_server_document_root
    end if ::Rails.env.production?
    config.to_prepare do
      ApplicationController.layout 'legs'
    end
    rake_tasks do
      load 'legs/Rakefile'
    end
  end
end
