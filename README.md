# Home

Home is a Windsor blueprint for the apps that a household runs. It uses [Core](https://github.com/windsorcli/core) as a source. Core brings up the Kubernetes platform. Home adds one opt-in facet for each app.

Home is planned. It is not ready for use. The name `home` is a working title and can change before the first public release.

Open source under [MPL 2.0](LICENSE). The licence covers the files of this repo only. Each app that Home deploys keeps its own licence. Drive Home with the [Windsor CLI](https://github.com/windsorcli/cli).

## Apps in v1

Each app is off until you turn it on in `values.yaml`.

| Facet | App | Value key |
| --- | --- | --- |
| `app-home-assistant` | [Home Assistant](https://www.home-assistant.io), with Mosquitto and Zigbee2MQTT | `home_assistant` |
| `app-jellyfin` | [Jellyfin](https://jellyfin.org) | `jellyfin` |
| `app-immich` | [Immich](https://immich.app) | `immich` |
| `app-frigate` | [Frigate](https://frigate.video) | `frigate` |

The facets are placeholders. They declare the `enabled` key of each app and no workloads yet.

## What Core provides

Home does not rebuild these layers. Each app uses them.

- Storage: the `csi` layer gives the StorageClasses. An app asks for a class by name.
- Certificates: the `pki` layer gives named issuers.
- Names: the `dns` layer gives private zones, and the `gateway` layer gives an `internal` Gateway. Each app publishes an HTTPRoute to it.

## Limits at v1

- Hardware placement is manual. A user pins an app to the node that has its device, such as a Zigbee dongle or a camera decoder, with a node selector.
- No backup path exists. Photos and camera footage are data that a home cannot recreate. Each app keeps its data on a volume of its StorageClass, and nothing copies that data elsewhere.
- Remote access is not part of Home. Use your own solution.
- Storage on a NAS needs an NFS driver in Core. Until Core has one, an app uses the StorageClasses that Core already provides.
