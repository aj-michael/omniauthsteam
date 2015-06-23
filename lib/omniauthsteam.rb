Dir[File.expand_path('../strategies/*.rb', __FILE__)].each { |f| require_relative f}
