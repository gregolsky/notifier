 $:.push File.expand_path("../lib", __FILE__)
 require "notifier/version"

 Gem::Specification.new do |s|
   s.name        = "notifier"
   s.version     = Notifier::VERSION
   s.authors     = ["Grzegorz Lachowski"]
   s.email       = ["gregory.lachowski@gmail.com"]
   s.homepage    = "https://github.com/gregorl/notifier"
   s.summary     = %q{Simple torrent management utility}
   s.description = %q{Simple torrent management utility}

   s.files         = `git ls-files`.split("\n")
   s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
   s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
   s.require_paths = ["lib"]
 end
