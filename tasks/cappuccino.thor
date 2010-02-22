require "fileutils"
require 'thor/rake_compat'
require 'rake/clean'

class Cappuccino < Thor
  include Thor::Actions
  include Thor::RakeCompat
  include FileUtils
  
  desc "build", "Build the cappuccino app into Resources/yogo_app for packaging"
  task :build => ['Resources/yogo_app']
  
  file 'Resources/yogo_app' do
    cd "cappuccino" do
      rm_rf "Build/*"
      sh "jake"
    end
  end
end