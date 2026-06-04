# ArulsIp SDK

Look up the caller's public IP address as plain text or JSON, with no signup or API key

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About Arul's IP API

Arul's IP API is a small public web service run by [Arul John](https://aruljohn.com/) that echoes back the caller's public IP address. It is hosted at `api.aruljohn.com` and documented alongside the operator's other public utilities at [aruljohn.com/api](https://aruljohn.com/api/).

What you get from the API:

- `GET /ip` returns the client IP as plain text (for example `199.199.199.199`)
- `GET /ip/json` returns the same value wrapped in JSON, e.g. `{"ip":"199.199.199.199"}`

No authentication, API key, or sign-up is required. CORS is enabled so the endpoints are usable directly from browser JavaScript. There is no published rate limit, but the operator asks callers to be reasonable with request volume.

## Try it

**TypeScript**
```bash
npm install aruls-ip
```

**Python**
```bash
pip install aruls-ip-sdk
```

**PHP**
```bash
composer require voxgig/aruls-ip-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/aruls-ip-sdk/go
```

**Ruby**
```bash
gem install aruls-ip-sdk
```

**Lua**
```bash
luarocks install aruls-ip-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { ArulsIpSDK } from 'aruls-ip'

const client = new ArulsIpSDK({})

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
cd go-mcp && go build -o aruls-ip-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "aruls-ip": {
      "command": "/abs/path/to/aruls-ip-mcp"
    }
  }
}
```

## Entities

The API exposes 2 entities:

| Entity | Description | API path |
| --- | --- | --- |
| **IpAddress** | The caller's public IP address as plain text, returned by `GET /ip`. | `/ip/json` |
| **Ipn** | The caller's public IP address wrapped in a JSON object, returned by `GET /ip/json`. | `/ip` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from arulsip_sdk import ArulsIpSDK

client = ArulsIpSDK({})


# Load a specific ipaddress
ipaddress, err = client.IpAddress(None).load(
    {"id": "example_id"}, None
)
```

### PHP

```php
<?php
require_once 'arulsip_sdk.php';

$client = new ArulsIpSDK([]);


// Load a specific ipaddress
[$ipaddress, $err] = $client->IpAddress(null)->load(
    ["id" => "example_id"], null
);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/aruls-ip-sdk/go"

client := sdk.NewArulsIpSDK(map[string]any{})

```

### Ruby

```ruby
require_relative "ArulsIp_sdk"

client = ArulsIpSDK.new({})


# Load a specific ipaddress
ipaddress, err = client.IpAddress(nil).load(
  { "id" => "example_id" }, nil
)
```

### Lua

```lua
local sdk = require("aruls-ip_sdk")

local client = sdk.new({})


-- Load a specific ipaddress
local ipaddress, err = client:IpAddress(nil):load(
  { id = "example_id" }, nil
)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = ArulsIpSDK.test()
const result = await client.IpAddress().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = ArulsIpSDK.test(None, None)
result, err = client.IpAddress(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = ArulsIpSDK::test(null, null);
[$result, $err] = $client->IpAddress(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.IpAddress(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = ArulsIpSDK.test(nil, nil)
result, err = client.IpAddress(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:IpAddress(nil):load(
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

## Using the Arul's IP API

- Upstream: [https://aruljohn.com/api/](https://aruljohn.com/api/)

- Free public web service, no authentication or API key required
- Provider asks callers to be reasonable with curl, jQuery, Postman, Ajax or other API call volume
- No formal SLA or published rate limit; the operator has previously retired other APIs due to abuse
- CORS is enabled, so the API can be called directly from browser JavaScript

---

Generated from the Arul's IP API OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
