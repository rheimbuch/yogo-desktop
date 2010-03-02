require 'thor'
require 'fileutils'
module Yogo
  class Build < Thor
    include FileUtils
    include Thor::Actions
    
    argument :path, :optional => true, :default => '.'
    class_option :repo, :type => :string, :group => :git, 
                 :default => "git@github.com:yogo/yogo.git", :aliases => "-r", 
                 :banner => "git repo url"
    class_option :branch, :type => :string, :group => :git, 
                 :aliases => "-b", :banner => "branch | tag | commit"
    # class_option :shallow, :type => :boolean, :group => :git, :default => false
    
    class_option :environment, :type => :string, :group => :rails, 
                 :default => "development", :aliases => "-e", 
                 :banner => "production | development | test | ..."
                 
    class_option :type, :type => :string, :group => :build, 
                 :default => "development", :aliases => "-t", 
                 :banner => "development | package"
    
    def initialize(*args)
      super
      @options = options.dup # We're going to be naughty mod some options based on option[:type]
      case options[:type]
      when "package"
        options[:environment] = 'production'
        # options[:shallow] = true
      when "development"
        options[:environment] ||= 'development'
      else
        puts "'#{options[:type]}' is not a valid build type!"
        exit 1
      end
      options.freeze # Freeze options so everything still works as expected
    end
    
    
    desc "complete", "Build a working yogo install in PATH"
    def complete
      invoke :checkout
      invoke :submodules
      invoke :gems
      invoke :db_config
      # invoke :db_seed
    end
    
  
    desc "checkout", "Checkout the yogo project"
    def checkout
      inside path do
        clone = ["git clone"]
        # clone << "--branch #{options[:branch]}" if options[:branch]
        # clone << "--depth 1" if options[:shallow]
        clone << options[:repo]
        clone << '.'
        
        run clone.join(' ')
        run "git checkout #{options[:branch]}" if options[:branch]
      end
    end
    
    desc "submodules", "Initialize and update git submodules"
    def submodules
      inside path do
        run "git submodule init && git submodule update"
      end
    end
    
    desc "gems", "Configure and bundle required gems"
    def gems
      inside path do
        run "gem install bundler -v='0.8.1'"
        run "gem install rake"
        run "gem bundle"
        if(options[:type] == "package")
          rm_rf Dir['vendor/bundled/**/cache/*.gem'] # Clear out cached gems before packaging
        end
      end
    end
    
    desc "db_config", "Setup the yogo database configuration"
    def db_config
      inside path do
        create_file "config/database.yml", FILES['database.yml']
      end
    end
    
    desc "db_seed", "Seed the yogo database with initial data"
    def db_seed
      inside path do
        run "rake db:seed NO_PERSEVERE=true RAILS_ENV=#{options[:environment]}"
      end
    end
  end
FILES = {}
FILES['database.yml'] = <<-DATABASE
# Yogo Data Management Toolkit
# Copyright (c) 2010 Montana State University
#
# License -> see license.txt
#
# FILE: database.yml.start
# 
#
development: 
  adapter: persevere
  host: localhost
  port: <%= ENV['PERSVR_PORT'] || 8080 %>

production:
  adapter: persevere
  host: localhost
  port: <%= ENV['PERSVR_PORT'] || 8080 %>

# run with bin/persvr -p 8081
test: &TEST
  adapter: persevere
  host: localhost
  port: <%= ENV['PERSVR_PORT'] || 8081 %>

cucumber:
  <<: *TEST

#
# Example Data Repository
#
example:
  adapter: sqlite3
  database: <%= File.join(RAILS_ROOT, 'db/example/example.sqlite3') %>
DATABASE
end