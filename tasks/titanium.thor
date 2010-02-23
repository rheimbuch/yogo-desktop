
class Titanium < Thor
  DEFAULT_VERSION = '0.8.1'
  class TitaniumInstallNotFoundError < StandardError; end
  class TitaniumSDKNotFoundError < StandardError; end
  class TitaniumBuildScriptNotFoundError < StandardError; end
  include Thor::Actions
  
  class_option :version, :type => :string, :default => (ENV['TITANIUM_VERSION'] || DEFAULT_VERSION)
  class_option :install, :type => :string, :default => ENV['TITANIUM_ROOT']
  class_option :sdk, :type => :string, :default => ENV['TITANIUM_SDK']
  class_option :build_script, :type => :string, :default => nil
  class_option :destination, :type => :string, :default => 'dist'
  
  def initialize(*args)
    super
    @options = options.dup
    
    case Config::CONFIG['host_os']
    when /mswin|windows/i
      options[:install] ||= 'C:\ProgramData\Titanium'
      options[:sdk] ||= File.join(options[:install], 'sdk', 'win32', options[:version])
      options[:build_script] ||= File.join(options[:sdk], 'tibuild.py')
    when /osx|darwin/i
      options[:install] ||= '/Library/Application Support/Titanium'
      options[:sdk] ||= File.join(options[:install], 'sdk', 'osx', options[:version])
      options[:build_script] ||= File.join(options[:sdk], 'tibuild.py')
    when /linux/i
      options[:install] ||= '/opt/titanium'
      options[:sdk] ||= File.join(options[:install], 'sdk', 'linux', options[:version])
      options[:build_script] ||= File.join(options[:sdk], 'tibuild.py')
    end
    
    
    options.freeze
    
    @missing = {}
    @missing[:install] = options[:install] unless File.exist? options[:install]
    @missing[:sdk] = options[:sdk] unless File.exist? options[:sdk]
    @missing[:build_script] = options[:build_script] unless File.exist? options[:sdk]
  end
  
  no_tasks do
    def check_titanium_install
      raise TitaniumInstallNotFoundError, @missing[:install] if @missing[:install]
      raise TitaniumSDKNotFoundError, @missing[:sdk] if @missing[:sdk]
      raise TitaniumBuildScriptNotFoundError, @missing[:build_script] if @missing[:build_script]
    end
  end
  
  desc "check", "check for the titanium sdk"
  def check
    bail = false
    begin
      check_titanium_install
    rescue TitaniumInstallNotFoundError => e
      puts "Could not find Titanium install at #{e.message}"
      bail = true
    rescue TitaniumSDKNotFoundError => e
      puts "Could not find Titanium SDK at #{e.message}"
      bail = true
    rescue TitaniumBuildScriptNotFoundError => e
      puts "Could not find the Titanium build script at #{e.message}"
      bail = true
    end
    
    exit 1 if bail
  end
  
  desc "build", "build the titanium app for the current platform"
  def build(project)
    # run '/Library/Application\ Support/Titanium/sdk/osx/0.8.1/tibuild.py -d dist/osx -s /Library/Application\ Support/Titanium -a /Library/Application\ Support/Titanium/sdk/osx/0.8.1 .'
    invoke :check
    run %{"#{options[:build_script]}" -d "#{options[:destination]}" -s "#{options[:install]}" -a "#{options[:sdk]}" "#{project}"}
  end
end