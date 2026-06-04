# AddressLookupService SDK

Look up Hong Kong addresses from free-text input via a public government API

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About Address Lookup Service

The Address Lookup Service (ALS) is a public API run by the Hong Kong Government for resolving free-text address strings into structured Hong Kong address records. It is hosted at [www.als.ogcio.gov.hk](https://www.als.ogcio.gov.hk/lookup) under the Office of the Government Chief Information Officer.

What you get from the API:

- Submit a free-text address query and receive matching Hong Kong address records.
- Both `GET` (query string) and `POST` request styles are supported for the same lookup operation.
- Useful for geocoding, address validation, and form auto-completion against the official Hong Kong address dataset.

Operational notes: the service is reachable over HTTPS at `https://www.als.ogcio.gov.hk/lookup` and is reported by community monitors to have CORS enabled, making it usable from browser clients. No authentication is documented in the OpenAPI definition.

## Try it

**TypeScript**
```bash
npm install address-lookup-service
```

**Python**
```bash
pip install address-lookup-service-sdk
```

**PHP**
```bash
composer require voxgig/address-lookup-service-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/address-lookup-service-sdk/go
```

**Ruby**
```bash
gem install address-lookup-service-sdk
```

**Lua**
```bash
luarocks install address-lookup-service-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { AddressLookupServiceSDK } from 'address-lookup-service'

const client = new AddressLookupServiceSDK({})

// List all searchaddressesgets
const searchaddressesgets = await client.SearchAddressesGet().list()
```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o address-lookup-service-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "address-lookup-service": {
      "command": "/abs/path/to/address-lookup-service-mcp"
    }
  }
}
```

## Entities

The API exposes 2 entities:

| Entity | Description | API path |
| --- | --- | --- |
| **SearchAddressesGet** | Address lookup via an HTTP GET request to `/lookup` with the free-text address supplied as a query parameter. | `/` |
| **SearchAddressesPost** | Address lookup via an HTTP POST request to `/lookup`, sending the free-text address in the request body for cases where a longer or structured input is preferred. | `/` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from addresslookupservice_sdk import AddressLookupServiceSDK

client = AddressLookupServiceSDK({})

# List all searchaddressesgets
searchaddressesgets, err = client.SearchAddressesGet(None).list(None, None)
```

### PHP

```php
<?php
require_once 'addresslookupservice_sdk.php';

$client = new AddressLookupServiceSDK([]);

// List all searchaddressesgets
[$searchaddressesgets, $err] = $client->SearchAddressesGet(null)->list(null, null);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/address-lookup-service-sdk/go"

client := sdk.NewAddressLookupServiceSDK(map[string]any{})

// List all searchaddressesgets
searchaddressesgets, err := client.SearchAddressesGet(nil).List(nil, nil)
```

### Ruby

```ruby
require_relative "AddressLookupService_sdk"

client = AddressLookupServiceSDK.new({})

# List all searchaddressesgets
searchaddressesgets, err = client.SearchAddressesGet(nil).list(nil, nil)
```

### Lua

```lua
local sdk = require("address-lookup-service_sdk")

local client = sdk.new({})

-- List all searchaddressesgets
local searchaddressesgets, err = client:SearchAddressesGet(nil):list(nil, nil)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = AddressLookupServiceSDK.test()
const result = await client.SearchAddressesGet().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = AddressLookupServiceSDK.test(None, None)
result, err = client.SearchAddressesGet(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = AddressLookupServiceSDK::test(null, null);
[$result, $err] = $client->SearchAddressesGet(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.SearchAddressesGet(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = AddressLookupServiceSDK.test(nil, nil)
result, err = client.SearchAddressesGet(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:SearchAddressesGet(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the Address Lookup Service

- Upstream: [https://www.als.ogcio.gov.hk/lookup](https://www.als.ogcio.gov.hk/lookup)

- Operated by the Office of the Government Chief Information Officer (OGCIO) of the Hong Kong SAR Government.
- Use is subject to the Hong Kong Government's terms of use and privacy policy.
- No explicit open licence is published in the OpenAPI spec; check the official OGCIO/Digital Policy Office pages for current terms before redistribution.

---

Generated from the Address Lookup Service OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
