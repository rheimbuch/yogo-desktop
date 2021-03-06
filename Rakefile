require 'rake/clean'
require 'yaml'

CLEAN.include("dist/*", "Resources/yogo", "Resources/yogo_app", "cappuccino/Build/*")

CONFIG = File.exist?('build_options.yml') ? YAML.load_file('build_options.yml') : {}

file "Resources/yogo_app" => "cappuccino/Build/yogo_app" do |t|
  cp_r "cappuccino/Build/yogo_app", "Resources/"
end

file "cappuccino/Build/yogo_app" do |t|
  cd "cappuccino" do
    sh "jake"
  end
end

namespace :yogo do
  desc "Build the Cappuccino UI"
  task :ui => "Resources/yogo_app"
  namespace :ui do
    desc "Remove the Cappuccino UI build products"
    task :clean do
      rm_rf FileList["Resources/yogo_app", "cappuccino/Build/*"]
    end
    
    desc "Rebuild the Cappuccino UI"
    task :rebuild => ['yogo:ui:clean', 'yogo:ui']
  end
end

file "Resources/yogo" do |t|
  sh "thor yogo:build:complete #{t} -t package -r git://github.com/yogo/yogo.git"
end


namespace :yogo do
  desc "Checkout and configure the yogo rails app"
  task :rails => "Resources/yogo"
  namespace :rails do
    desc "Remove the yogo rails app"
    task :clean do
      rm_rf "Resources/yogo"
    end
    
    desc "Rebuild/reconfigure the yogo rails app"
    task :rebuild => ['yogo:rails:clean', 'yogo:rails']
  end
end


TITANIUM_PATH = ENV['TITANIUM_PATH'] || (CONFIG['titanium'] && CONFIG['titanium']['path']) || '/Library/Application\ Support/Titanium'
TITANIUM_VERSION = ENV['TITANIUM_VERSION'] || (CONFIG['titanium'] && CONFIG['titanium']['version']) || '0.8.5'
TITANIUM_PLATFORM = ENV['TITANIUM_PLATFORM'] || (CONFIG['titanium'] && CONFIG['titanium']['platform']) || 'osx'
sdk = File.join(TITANIUM_PATH, 'sdk', TITANIUM_PLATFORM, TITANIUM_VERSION)
build_script = File.join(sdk, 'tibuild.py')

DIST_PATH = ENV['DIST_PATH'] || CONFIG['dist'] || File.join('dist', TITANIUM_PLATFORM)

directory DIST_PATH
file File.join(DIST_PATH,'YogoDesktop.app') => [DIST_PATH, 'Resources/yogo_app', 'Resources/yogo'] do
  sh "python #{build_script} -s #{TITANIUM_PATH} -a #{sdk} -p no -d #{DIST_PATH} ."
end

namespace :yogo do
  desc "Build/rebuild the Titanium Desktop app"
  namespace :desktop do
    task :osx => ['yogo:ui:rebuild', 'yogo:desktop:clean', File.join(DIST_PATH,'YogoDesktop.app')]
    
    task :clean do
      rm_rf "dist/*"
    end
    
    namespace :osx do
      task :run => "yogo:desktop:osx" do
        sh "./dist/osx/YogoDesktop.app/Contents/MacOS/YogoDesktop --debug"
      end
    end
  end
end



