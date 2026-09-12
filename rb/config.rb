# AddressLookupService SDK configuration

module AddressLookupServiceConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "AddressLookupService",
        "slug" => "address-lookup-service",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
          "transport" => "base",
        },
      },
      "options" => {
        "base" => "https://www.als.ogcio.gov.hk/lookup",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "search_addresses_get" => {},
          "search_addresses_post" => {},
        },
      },
      "entity" => {
        "search_addresses_get" => {
          "fields" => [
            {
              "name" => "Address",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "ValidationInformation",
              "type" => "`$OBJECT`",
            },
          ],
          "name" => "search_addresses_get",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "example" => 10,
                        "kind" => "query",
                        "name" => "n",
                        "orig" => "n",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => "香港中環皇后大道中1號",
                        "kind" => "query",
                        "name" => "q",
                        "orig" => "q",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/",
                  "segments" => [],
                  "select" => {
                    "exist" => [
                      "n",
                      "q",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.SuggestedAddress`",
                  },
                  "parts" => [],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "search_addresses_post" => {
          "fields" => [
            {
              "name" => "SuggestedAddress",
              "short" => "List of suggested addresses matching the query",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "n",
              "short" => "Number of records to return",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "q",
              "req" => true,
              "short" => "Free-text address query string",
              "type" => "`$STRING`",
            },
          ],
          "name" => "search_addresses_post",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/",
                  "segments" => [],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    AddressLookupServiceFeatures.make_feature(name)
  end
end
