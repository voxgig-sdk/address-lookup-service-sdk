"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.FEATURE_PLUGINS = exports.config = void 0;
const TestFeature_1 = require("./feature/test/TestFeature");
const FEATURE_CLASS = {
    test: TestFeature_1.TestFeature,
};
// Per-feature plugin DEFINITIONS (voxgig/plugin `Definition` values), from
// the model's active plugin groups. A feature that takes a `plugins` option
// (secrets over sekreto) reads its own entry; a feature with no plugins has
// none. Named imports above make each definition statically reachable, so
// an SDK carries exactly the plugin modules its model selects — the same
// leanness the old side-effect registry imports bought, without a registry.
const FEATURE_PLUGINS = {};
exports.FEATURE_PLUGINS = FEATURE_PLUGINS;
class Config {
    makeFeature(fn) {
        const fc = FEATURE_CLASS[fn];
        const fi = new fc();
        // TODO: errors etc
        return fi;
    }
    // False for a feature added at runtime via options.extend (station's
    // adopt path) - the constructor uses this to skip makeFeature for names
    // no generated class backs.
    hasFeature(fn) {
        return null != FEATURE_CLASS[fn];
    }
    main = {
        name: 'AddressLookupService',
        slug: "address-lookup-service",
        version: "0.0.1",
        target: "ts",
    };
    feature = {
        test: {
            "options": {
                "active": false
            },
            "transport": "base"
        },
    };
    options = {
        base: "https://www.als.ogcio.gov.hk/lookup",
        headers: {
            "content-type": "application/json"
        },
        entity: {
            search_addresses_get: {},
            search_addresses_post: {},
        }
    };
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
                            "segments": [],
                            "select": {
                                "exist": [
                                    "n",
                                    "q"
                                ]
                            },
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body.SuggestedAddress`"
                            },
                            "parts": []
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
                            "segments": [],
                            "select": {},
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body`"
                            },
                            "parts": []
                        }
                    ]
                }
            },
            "relations": {
                "ancestors": []
            }
        }
    };
}
const config = new Config();
exports.config = config;
//# sourceMappingURL=Config.js.map