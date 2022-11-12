# gateway-api

A Helm chart for creating gateway-api configuration

This is a chart that provides common network ingress definitions using the [Kubernetes Gateway API](https://github.com/kubernetes-sigs/gateway-api).

The chart support the 'multiple personas' pattern with e.g. 'developers' and 'cluster operators' described by the Gateway API documentation.

![Gateway API model](https://gateway-api.sigs.k8s.io/images/api-model.png)

Cluster operators may instantiate a Gateway using the following values:

```yaml
gateway:
  gatewayClassName: gwclass-name
  listeners:
    web:
      port: 80
      protocol: HTTP
      hostname: "*.example.com"
```

SImilarly, developers may define routes for HTTP services with:

```yaml
gateway:
  name: gateway-created-by-cluster-operator

httproutes:
  my-service:
    uriprefix: "a-prefix"
    destination: my-svc
    namespace: my-ns
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| gateway.addresses | list | `[]` | Optional list of addresses to associate with the gateway |
| gateway.create | bool | `false` | Create Gateway. A non-nil list of listeners also enable Gateway creation. If no Gateway is created the HTTPRoutes should be mesh attached. |
| gateway.gatewayClassName | string | `nil` |  |
| gateway.listeners | object | `{}` | List of gateway listeners. Gateway resources are only created if at least one listener is defined |
| gateway.name | string | `nil` | Gateway name defaults to a name based on the chart release name. Also used for HTTPRoutes, including when no gateway resource is created |
| httproutes | object | `{}` |  |
| labels | object | `{}` |  |
| referencegrant | object | `{"enabled":true}` | Create ReferenceGrant for all HTTPRoute's that have an explicit namespace. |
| referencegrant.enabled | bool | `true` | Create ReferenceGrant for HTTPRoutes |
