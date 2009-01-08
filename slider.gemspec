Gem::Specification.new do |s|
  s.name        = "slider"
  s.version     = "0.1.1"
  s.date        = "2008-11-07"
  s.summary     = "Text-based slideshow creation and playback"
  s.email       = "david@goodlad.ca"
  s.homepage    = "http://github.com/dgoodlad/slider"
  s.description = "Slider is a Ruby library to build and display slideshows for presentations"
  s.has_rdoc    = false
  s.authors     = ["David Goodlad"]
  s.files       = [ "MIT-LICENSE",
                    "README",
                    "slider.gemspec",
                    "lib/slider.rb",
                    "doc/example.rb" ]

  s.add_dependency "Text", ["> 0.0.0"]
end
