
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature,

}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }

  // False for a feature added at runtime via options.extend (station's
  // adopt path) - the constructor uses this to skip makeFeature for names
  // no generated class backs.
  hasFeature(this: any, fn: string) {
    return null != FEATURE_CLASS[fn]
  }


  main = {
    name: 'AddressLookupService',
        slug: "address-lookup-service",
    version: "0.0.1",
    target: "ts",

  }


  feature = {
     test:     {
      "options": {
        "active": false
      },
      "transport": "base"
    },

  }


  options = {
    base: "https://www.als.ogcio.gov.hk/lookup",

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      search_addresses_get: {
      },

      search_addresses_post: {
      },

    }
  }


  entity = {
    "search_addresses_get": {
      "fields": [
        {
          "name": "Address",
          "type": "`$OBJECT`"
        },
        {
          "name": "ValidationInformation",
          "type": "`$OBJECT`"
        }
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
                    "type": "`$INTEGER`"
                  },
                  {
                    "example": "香港中環皇后大道中1號",
                    "kind": "query",
                    "name": "q",
                    "orig": "q",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/",
              "parts": [],
              "select": {
                "exist": [
                  "n",
                  "q"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body.SuggestedAddress`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "search_addresses_post": {
      "fields": [
        {
          "name": "SuggestedAddress",
          "short": "List of suggested addresses matching the query",
          "type": "`$ARRAY`"
        },
        {
          "name": "n",
          "short": "Number of records to return",
          "type": "`$INTEGER`"
        },
        {
          "name": "q",
          "req": true,
          "short": "Free-text address query string",
          "type": "`$STRING`"
        }
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
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    }
  }
}


const config = new Config()

export {
  config
}

