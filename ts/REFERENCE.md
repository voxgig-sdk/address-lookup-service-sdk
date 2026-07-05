# AddressLookupService TypeScript SDK Reference

Complete API reference for the AddressLookupService TypeScript SDK.


## AddressLookupServiceSDK

### Constructor

```ts
new AddressLookupServiceSDK(options?: object)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `object` | SDK configuration options. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `object` | Custom headers for all requests. |
| `options.feature` | `object` | Feature configuration. |
| `options.system` | `object` | System overrides (e.g. custom fetch). |


### Static Methods

#### `AddressLookupServiceSDK.test(testopts?, sdkopts?)`

Create a test client with mock features active.

```ts
const client = AddressLookupServiceSDK.test()
```

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `testopts` | `object` | Test feature options. |
| `sdkopts` | `object` | Additional SDK options merged with test defaults. |

**Returns:** `AddressLookupServiceSDK` instance in test mode.


### Instance Methods

#### `SearchAddressesGet(data?: object)`

Create a new `SearchAddressesGet` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `SearchAddressesGetEntity` instance.

#### `SearchAddressesPost(data?: object)`

Create a new `SearchAddressesPost` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `SearchAddressesPostEntity` instance.

#### `options()`

Return a deep copy of the current SDK options.

**Returns:** `object`

#### `utility()`

Return a copy of the SDK utility object.

**Returns:** `object`

#### `direct(fetchargs?: object)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `GET`). |
| `fetchargs.params` | `object` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `object` | Query string parameters. |
| `fetchargs.headers` | `object` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (objects are JSON-serialized). |
| `fetchargs.ctrl` | `object` | Control options (e.g. `{ explain: true }`). |

**Returns:** `Promise<{ ok, status, headers, data } | Error>`

#### `prepare(fetchargs?: object)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `Promise<{ url, method, headers, body } | Error>`

#### `tester(testopts?, sdkopts?)`

Alias for `AddressLookupServiceSDK.test()`.

**Returns:** `AddressLookupServiceSDK` instance in test mode.


---

## SearchAddressesGetEntity

```ts
const search_addresses_get = client.SearchAddressesGet()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address` | `Record<string, any>` | No |  |
| `validation_information` | `Record<string, any>` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.SearchAddressesGet().list()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `SearchAddressesGetEntity` instance with the same client and
options.

#### `client()`

Return the parent `AddressLookupServiceSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## SearchAddressesPostEntity

```ts
const search_addresses_post = client.SearchAddressesPost()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `n` | `number` | No |  |
| `q` | `string` | Yes |  |
| `suggested_address` | `any[]` | No |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.SearchAddressesPost().create({
  q: /* string */,
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `SearchAddressesPostEntity` instance with the same client and
options.

#### `client()`

Return the parent `AddressLookupServiceSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ts
const client = new AddressLookupServiceSDK({
  feature: {
    test: { active: true },
  }
})
```

