Gem::Specification.new do |s|
  s.name = 'omniauthsteam'
  s.version = '0.0.0'
  s.author = 'Adam Michael'
  s.email = 'adam@ajmichael.net'
  s.summary = 'Authenticates your Ruby app to steam.'
  s.require_paths = ['lib']
  s.files += Dir['lib/*.rb']
  s.files += Dir['lib/strategies/*.rb']
end
