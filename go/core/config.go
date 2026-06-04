package core

func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "AddressLookupService",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
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
						"name": "address",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 0,
					},
					map[string]any{
						"name": "validation_information",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 1,
					},
				},
				"name": "search_addresses_get",
				"op": map[string]any{
					"list": map[string]any{
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
											"reqd": false,
											"type": "`$INTEGER`",
											"active": true,
										},
										map[string]any{
											"example": "香港中環皇后大道中1號",
											"kind": "query",
											"name": "q",
											"orig": "q",
											"reqd": true,
											"type": "`$STRING`",
											"active": true,
										},
									},
								},
								"method": "GET",
								"orig": "/",
								"select": map[string]any{
									"exist": []any{
										"n",
										"q",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"parts": []any{},
								"index$": 0,
							},
						},
						"input": "data",
						"key$": "list",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"search_addresses_post": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "n",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 0,
					},
					map[string]any{
						"name": "q",
						"req": true,
						"type": "`$STRING`",
						"active": true,
						"index$": 1,
					},
					map[string]any{
						"name": "suggested_address",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 2,
					},
				},
				"name": "search_addresses_post",
				"op": map[string]any{
					"create": map[string]any{
						"name": "create",
						"points": []any{
							map[string]any{
								"method": "POST",
								"orig": "/",
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"parts": []any{},
								"args": map[string]any{},
								"select": map[string]any{},
								"index$": 0,
							},
						},
						"input": "data",
						"key$": "create",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
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
