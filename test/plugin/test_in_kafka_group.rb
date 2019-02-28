require 'helper'
require 'fluent/test/driver/input'
require 'fluent/plugin/in_kafka_group'

class KafkaInputTest < Test::Unit::TestCase

  setup do
    Fluent::Test.setup
    @tag = 'test.tag'
  end

  def create_driver(conf={})
    Fluent::Test::Driver::Input.new(Fluent::Plugin::KafkaGroupInput).configure(conf)
  end

  CONFIG = %[
              brokers 10.95.108.206:9092,10.95.108.207:9092,10.95.108.208:9092
              format json
        
              consumer_group got.mockdata
              topics got.mockdata
              start_from_beginning false
            ]

  def test_cassandra
    d = create_driver(CONFIG)

    d.run
    
    print d.events[0][0]
  end

end