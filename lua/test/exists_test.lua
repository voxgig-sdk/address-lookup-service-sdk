-- ProjectName SDK exists test

local sdk = require("address-lookup-service_sdk")

describe("AddressLookupServiceSDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)
