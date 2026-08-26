-- AddressLookupService SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "AddressLookupService",
      slug = "address-lookup-service",
      version = "0.0.1",
      target = "lua",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
        ["transport"] = "base",
      },
    },
    options = {
      base = "https://www.als.ogcio.gov.hk/lookup",
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["search_addresses_get"] = {},
        ["search_addresses_post"] = {},
      },
    },
    entity = {
      ["search_addresses_get"] = {
        ["fields"] = {
          {
            ["name"] = "Address",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "ValidationInformation",
            ["type"] = "`$OBJECT`",
          },
        },
        ["name"] = "search_addresses_get",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["example"] = 10,
                      ["kind"] = "query",
                      ["name"] = "n",
                      ["orig"] = "n",
                      ["type"] = "`$INTEGER`",
                    },
                    {
                      ["example"] = "香港中環皇后大道中1號",
                      ["kind"] = "query",
                      ["name"] = "q",
                      ["orig"] = "q",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/",
                ["parts"] = {},
                ["select"] = {
                  ["exist"] = {
                    "n",
                    "q",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.SuggestedAddress`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["search_addresses_post"] = {
        ["fields"] = {
          {
            ["name"] = "SuggestedAddress",
            ["short"] = "List of suggested addresses matching the query",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "n",
            ["short"] = "Number of records to return",
            ["type"] = "`$INTEGER`",
          },
          {
            ["name"] = "q",
            ["req"] = true,
            ["short"] = "Free-text address query string",
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "search_addresses_post",
        ["op"] = {
          ["create"] = {
            ["input"] = "data",
            ["name"] = "create",
            ["points"] = {
              {
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "POST",
                ["orig"] = "/",
                ["parts"] = {},
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
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
