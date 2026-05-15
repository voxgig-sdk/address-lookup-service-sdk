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
            "auth": {
                "prefix": "Bearer",
            },
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
            "name": "address",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 0,
          },
          {
            "name": "validation_information",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 1,
          },
        ],
        "name": "search_addresses_get",
        "op": {
          "list": {
            "name": "list",
            "points": [
              {
                "args": {
                  "query": [
                    {
                      "example": 10,
                      "kind": "query",
                      "name": "n",
                      "orig": "n",
                      "reqd": False,
                      "type": "`$INTEGER`",
                      "active": True,
                    },
                    {
                      "example": "香港中環皇后大道中1號",
                      "kind": "query",
                      "name": "q",
                      "orig": "q",
                      "reqd": True,
                      "type": "`$STRING`",
                      "active": True,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/",
                "select": {
                  "exist": [
                    "n",
                    "q",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "parts": [],
                "index$": 0,
              },
            ],
            "input": "data",
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
            "name": "n",
            "req": False,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 0,
          },
          {
            "name": "q",
            "req": True,
            "type": "`$STRING`",
            "active": True,
            "index$": 1,
          },
          {
            "name": "suggested_address",
            "req": False,
            "type": "`$ARRAY`",
            "active": True,
            "index$": 2,
          },
        ],
        "name": "search_addresses_post",
        "op": {
          "create": {
            "name": "create",
            "points": [
              {
                "method": "POST",
                "orig": "/",
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "parts": [],
                "args": {},
                "select": {},
                "index$": 0,
              },
            ],
            "input": "data",
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
