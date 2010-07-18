require 'fileutils'

module Legs
  ROOT = File.expand_path File.join(File.dirname(__FILE__), '..')
  
  def self.view_path
    File.join ROOT, 'app', 'views'
  end
  
  def self.helper_file
    File.join ROOT, 'app', 'helpers', 'legs_helper.rb'
  end
  
  def self.public_path
    File.join ROOT, 'public'
  end
  
  def self.copy_static_files_to_web_server_document_root
    Dir[File.join(public_path, '*')].each do |source_path|
      dest_path = File.join(Rails.root, 'public', source_path.gsub(public_path, ''))
      if File.directory? source_path
        FileUtils.cp_r source_path.concat('/.'), dest_path
      else
        FileUtils.cp source_path, dest_path
      end
    end
  end
end

require 'legs/railtie'