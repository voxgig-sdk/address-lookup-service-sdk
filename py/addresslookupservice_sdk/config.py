# AddressLookupService SDK configuration


def make_config():
    return {
        "main": {
            "name": "AddressLookupService",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://www.als.ogcio.gov.hk/lookup",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "search_addresses_get": {},
                "search_addresses_post": {},
            },
        },
        "entity": {
      "search_addresses_get": {
        "fields": [
          {
            "active": True,
            "name": "Address",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "ValidationInformation",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 1,
          },
        ],
        "name": "search_addresses_get",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "active": True,
                "args": {
                  "query": [
                    {
                      "active": True,
                      "example": 10,
                      "kind": "query",
                      "name": "n",
                      "orig": "n",
                      "reqd": False,
                      "type": "`$INTEGER`",
                    },
                    {
                      "active": True,
                      "example": "香港中環皇后大道中1號",
                      "kind": "query",
                      "name": "q",
                      "orig": "q",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/",
                "parts": [],
                "select": {
                  "exist": [
                    "n",
                    "q",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.SuggestedAddress`",
                },
                "index$": 0,
              },
            ],
            "key$": "list",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "search_addresses_post": {
        "fields": [
          {
            "active": True,
            "name": "SuggestedAddress",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "n",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "q",
            "req": True,
            "type": "`$STRING`",
            "index$": 2,
          },
        ],
        "name": "search_addresses_post",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {},
                "kind": "http",
                "method": "POST",
                "orig": "/",
                "parts": [],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
