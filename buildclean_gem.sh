bundle clean --force
gem clean
gem build fluent-plugin-kafka.gemspec
gem install fluent-plugin-kafka-custom-ruby-version-$1.gem
