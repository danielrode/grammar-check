# grammar-check

Checks the grammar of a text file using
[LanguageTool](https://languagetool.org/) and
[gramma](https://caderek.github.io/gramma/) (both run locally, within
a container)

## Run

```sh
podman run -it --rm --network none --volume "$(pwd):$(pwd)" --workdir "$(pwd)" ghcr.io/vogelerlab/grammar-check:main ./text-file-path-to-check.txt
```
