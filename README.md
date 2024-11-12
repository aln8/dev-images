# dev-images

switching from old many dockerfile to `docker buildx bake` with hcl support

example command:

```bash
manifest=0 os_vers=focal,jammy targets=base,golang archs=amd64,arm64 docker buildx bake
```

`manifest` option is use for turn on multi-platform build or tag build for each multi-platform

you can play arount with `docker buildx bake --print` to see the different

