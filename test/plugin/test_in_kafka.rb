require 'fluent/input'
require 'fluent/plugin/in_kafka_group'

class KafkaInputTest < Test::Unit::TestCase
  def setup
    Fluent::Test.setup
  end

  CONFIG = %[
          brokers 172.16.2.114:9092,172.16.2.115:9092,172.16.2.116:9092
          format json
          consumer_group journey-playground
          topics journey-playground
          kafka_message_key message_key
          start_from_beginning true

          principal journey@KAFKA.SECURE
          keytab E:\\doc_true\\kafka_client\\journey.user.service.keytab
          sasl_over_ssl false

          ssl_ca_cert E:\\doc_true\\kafka_client\\kafka.client.cert.pem
    ]

  def create_driver(conf = CONFIG)
    Fluent::Test::Driver::Input.new(Fluent::Plugin::MyInput).configure(conf)
  end

  def test_read
    d = create_driver
    d.run(timeout: 10)
    
    d.events.each do |tag, time, record|
      print record
    end
  end
end