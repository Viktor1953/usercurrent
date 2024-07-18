Add the turbo-rails gem to your Gemfile: gem 'turbo-rails'
Run ./bin/bundle install
Run ./bin/rails turbo:install
Run ./bin/rails turbo:install:redis to change the development Action Cable adapter from Async (the default one) to Redis. The Async adapter does not support Turbo Stream broadcasting.