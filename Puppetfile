# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    #options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/devel/puppet-#{name}"
end

# Shortcut for a forge module
def forge(name, *args)
  mod name, version
end

# Support for default hiera data in modules

github "module-data", "0.0.4", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

forge "saz-dnsmasq",   "1.1.0"
#github "foreman",     "1.2.0"
#github "gcc",         "2.2.0", :repo => "telamonian/puppet-gcc"
#github "git",         "2.7.0", :repo => "telamonian/puppet-git"
#github "go",          "1.1.0"
#github "homebrew",    "2.0.0", :repo => "telamonian/puppet-homebrew"
#github "hub",         "1.4.0", :repo => "telamonian/puppet-hub"
#github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
#github "nginx",       "1.4.3"
#github "nodejs",      "3.8.1"
#github "openssl",     "1.0.0"
#github "phantomjs",   "2.3.0"
#github "pkgconfig",   "1.0.0"
#github "repository",  "2.3.0"
#github "ruby",        "8.2.0", :repo => "telamonian/puppet-ruby"
#forge "stdlib",      "4.2.1"
#github "sudo",        "1.0.0"

# Optional/custom modules
github "profiles", "0.0.1", :repo => "phathocker/puppet-profiles"
