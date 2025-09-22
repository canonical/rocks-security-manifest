# rocks-security-manifest

This utility repository provides a definition of the security 
manifest required by rocks maintained under the [OCI-Factory](https://github.com/canonical/oci-factory).
More information can be found in in the link below.
https://github.com/canonical/oci-factory/blob/main/IMAGE_MAINTAINER_AGREEMENT.md#enable-security-monitoring

To include the manifest as part of your rock copy the following 
part into the base of your `rockcraft.yaml` project file.

```
  deb-security-manifest:
    plugin: nil
    after: [<all-other-slice-names>]
    source: https://github.com/canonical/rocks-security-manifest
    source-type: git
    source-branch: main
    override-build: ./install_gen_manifest
    override-prime: gen_manifest
```

Note the [after](https://documentation.ubuntu.com/rockcraft/stable/common/craft-parts/reference/part_properties/#after) part
property which ensures that `deb-security-manifest` is generated after all other parts are build, and therefore
correctly included in the manifest.