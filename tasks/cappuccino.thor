require "fileutils"

class Cappuccino < Thor
  include Thor::Actions
  include FileUtils
  
  desc "build", "Build the cappuccino app into Resources/yogo_app for packaging"
  def build
    inside "cappuccino" do
      rm_rf "Build/*"
      run "jake"
    end
  end
end