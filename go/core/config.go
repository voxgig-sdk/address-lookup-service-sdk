package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "AddressLookupService",
			"slug": "address-lookup-service",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"transport": "base",
			},
		},
		"options": map[string]any{
			"base": "https://www.als.ogcio.gov.hk/lookup",
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"search_addresses_get": map[string]any{},
				"search_addresses_post": map[string]any{},
			},
		},
		"entity": map[string]any{
			"search_addresses_get": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "Address",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "ValidationInformation",
						"type": "`$OBJECT`",
					},
				},
				"name": "search_addresses_get",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"example": 10,
											"kind": "query",
											"name": "n",
											"orig": "n",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": "香港中環皇后大道中1號",
											"kind": "query",
											"name": "q",
											"orig": "q",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/",
								"parts": []any{},
								"select": map[string]any{
									"exist": []any{
										"n",
										"q",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.SuggestedAddress`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"search_addresses_post": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "SuggestedAddress",
						"short": "List of suggested addresses matching the query",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "n",
						"short": "Number of records to return",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "q",
						"req": true,
						"short": "Free-text address query string",
						"type": "`$STRING`",
					},
				},
				"name": "search_addresses_post",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "POST",
								"orig": "/",
								"parts": []any{},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
