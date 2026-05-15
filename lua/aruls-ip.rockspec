package = "voxgig-sdk-aruls-ip"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/aruls-ip-sdk.git"
}
description = {
  summary = "ArulsIp SDK for Lua",
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
    ["aruls-ip_sdk"] = "aruls-ip_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
