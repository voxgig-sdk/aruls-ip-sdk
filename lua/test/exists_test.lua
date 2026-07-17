-- ArulsIp SDK exists test

local sdk = require("aruls-ip_sdk")

describe("ArulsIpSDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)
