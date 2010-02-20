class Titanium < Thor
  include Thor::Actions
  
  desc "build", "build the titanium app for the current platform"
  def build
    run '/Library/Application\ Support/Titanium/sdk/osx/0.8.1/tibuild.py -d dist/osx -s /Library/Application\ Support/Titanium -a /Library/Application\ Support/Titanium/sdk/osx/0.8.1 .'
  end
end