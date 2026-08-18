# AddressLookupService SDK configuration


_shared_config = None


def shared_config():
    """Return the process-wide config, built once on first use.

    The SDK reads the config on every request and never writes to it, so one
    instance is shared by every client rather than rebuilt per client.

    The returned dict is shared: treat it as read-only. Callers that need to
    mutate should use make_config, which always returns a fresh copy.
    """
    global _shared_config
    if _shared_config is None:
        _shared_config = make_config()
    return _shared_config


def make_config():
    """Build a fresh, fully materialised config dict.

    Every call rebuilds the whole structure, so prefer shared_config unless
    you need a private copy you intend to mutate.
    """
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
            "name": "Address",
            "type": "`$OBJECT`",
          },
          {
            "name": "ValidationInformation",
            "type": "`$OBJECT`",
          },
        ],
        "name": "search_addresses_get",
        "op": {
          "list": {
            "input": "data",
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
                      "type": "`$INTEGER`",
                    },
                    {
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
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "search_addresses_post": {
        "fields": [
          {
            "name": "SuggestedAddress",
            "type": "`$ARRAY`",
          },
          {
            "name": "n",
            "type": "`$INTEGER`",
          },
          {
            "name": "q",
            "req": True,
            "type": "`$STRING`",
          },
        ],
        "name": "search_addresses_post",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
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
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
