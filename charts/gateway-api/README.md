# gateway-api

A Helm chart for creating gateway-api configuration

See [Kubernetes Gateway API](https://github.com/kubernetes-sigs/gateway-api)

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| gateway.addresses | list | `[]` | Optional list of addresses to associate with the gateway |
| gateway.gatewayClassName | string | `nil` |  |
| gateway.listeners | object | `{}` | List of gateway listeners. Gateway resources are only created if at least one listener is defined |
| gateway.name | string | `nil` | Gateway name defaults to a name based on the chart release name. Also used for HTTPRoutes, including when no gateway resource is created |
| httproutes | object | `{}` |  |
| labels | object | `{}` |  |
| referencegrant | object | `{"enabled":true}` | Create ReferenceGrant for all HTTPRoute's that have an explicit namespace. |
| referencegrant.enabled | bool | `true` | Create ReferenceGrant for HTTPRoutes |
