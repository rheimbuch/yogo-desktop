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

task :yogo_app => "Resources/yogo_app"
namespace :yogo_app do
  task :clean do
    rm_rf FileList["Resources/yogo_app", "cappuccino/Build/*"]
  end
  
  task :rebuild => ['yogo_app:clean', 'yogo_app']
end