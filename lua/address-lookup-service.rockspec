package = "voxgig-sdk-address-lookup-service"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/address-lookup-service-sdk.git"
}
description = {
  summary = "AddressLookupService SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["address-lookup-service_sdk"] = "address-lookup-service_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
