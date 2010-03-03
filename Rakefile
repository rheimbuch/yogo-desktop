require 'rake/clean'

CLEAN.include("dist/*", "Resources/yogo", "Resources/yogo_app", "cappuccino/Build/*")


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

TITANIUM_PATH = ENV['TITANIUM_PATH'] || '/Library/Application\ Support/Titanium'
TITANIUM_VERSION = ENV['TITANIUM_VERSION'] || '0.8.5'
TITANIUM_PLATFORM = ENV['TITANIUM_PLATFORM'] || 'osx'
sdk = File.join(TITANIUM_PATH, 'sdk', TITANIUM_PLATFORM, TITANIUM_VERSION)
build_script = File.join(sdk, 'tibuild.py')

directory "dist/osx"
file "dist/osx/YogoDesktop.app" => ['dist/osx', 'Resources/yogo_app', 'Resources/yogo'] do
  sh "python #{build_script} -s #{TITANIUM_PATH} -a #{sdk} -p no -d dist/osx ."
end

namespace :yogo do
  desc "Build/rebuild the Titanium Desktop app"
  namespace :desktop do
    task :osx => ['yogo:ui:rebuild', 'yogo:desktop:clean', "dist/osx/YogoDesktop.app"]
    
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



