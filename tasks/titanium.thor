TITANIUM = {
  'root' => {
  'osx' => ['/Library/Application\ Support/Titanium/', '~/Library/Application\ Support/Titanium/'],
  'win32' => ['C:\ProgramData\Titanium']
  }
}
class Titanium < Thor
  DEFAULT_VERSION = '0.8.1'
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
    
    raise "Titanium Install not found at #{options[:install]}" unless File.exist? options[:install]
    raise "Titanium sdk not found at #{options[:sdk]}" unless File.exist? options[:sdk]
    raise "tibuild.py script not found: #{options[:build_script]}" unless File.exist? options[:build_script]
    
  end
  
  desc "build", "build the titanium app for the current platform"
  def build(project)
    # run '/Library/Application\ Support/Titanium/sdk/osx/0.8.1/tibuild.py -d dist/osx -s /Library/Application\ Support/Titanium -a /Library/Application\ Support/Titanium/sdk/osx/0.8.1 .'
    run %{"#{options[:build_script]}" -d "#{options[:destination]}" -s "#{options[:install]}" -a "#{options[:sdk]}" "#{project}"}
  end
end