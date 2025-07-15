# rocks-security-manifest

This utility repository provides a definition of the security 
manifest required by rocks maintained under the [OCI-Factory](https://github.com/canonical/oci-factory).
More information can be found in in the link below.
https://github.com/canonical/oci-factory/blob/main/IMAGE_MAINTAINER_AGREEMENT.md#enable-security-monitoring


To include the manifest as part of your rock copy the following 
part into the base of your `rockcraft.yaml` project file.
```
  deb-security-manifest:
    plugin: make
    source: https://github.com/canonical/rocks-security-manifest
    source-type: git
    source-branch: main
    override-prime: gen_manifest
```