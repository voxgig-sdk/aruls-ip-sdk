-- ArulsIp SDK configuration

local function make_config()
  return {
    main = {
      name = "ArulsIp",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
      },
    },
    options = {
      base = "https://api.aruljohn.com",
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["ip_address"] = {},
        ["ipn"] = {},
      },
    },
    entity = {
      ["ip_address"] = {
        ["fields"] = {
          {
            ["active"] = true,
            ["name"] = "ip",
            ["req"] = true,
            ["type"] = "`$STRING`",
            ["index$"] = 0,
          },
        },
        ["name"] = "ip_address",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["active"] = true,
                ["args"] = {},
                ["method"] = "GET",
                ["orig"] = "/ip/json",
                ["parts"] = {
                  "ip",
                  "json",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["index$"] = 0,
              },
            },
            ["key$"] = "load",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["ipn"] = {
        ["fields"] = {},
        ["name"] = "ipn",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["active"] = true,
                ["args"] = {},
                ["method"] = "GET",
                ["orig"] = "/ip",
                ["parts"] = {
                  "ip",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["index$"] = 0,
              },
            },
            ["key$"] = "load",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
