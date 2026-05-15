# ArulsIp SDK exists test

require "minitest/autorun"
require_relative "../ArulsIp_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = ArulsIpSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
