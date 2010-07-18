module Legs
  class Railtie < Rails::Railtie
    config.app_middleware.use '::ActionDispatch::Static', Legs.public_path unless ::Rails.env.production?
    initializer 'legs.add_paths' do |app|
      app.paths.app.views.push Legs.view_path
    end
    initializer 'legs.copy_static_files_to_web_server_document_root' do
      Legs.copy_static_files_to_web_server_document_root
    end if ::Rails.env.production?
    config.to_prepare do
      require Legs.helper_file
      ApplicationController.helper Legs::Helper
      ApplicationController.layout 'legs'
    end
  end
end
