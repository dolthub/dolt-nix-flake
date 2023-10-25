dolt-nix-flake
==============

A nix flake with a derivation for a build of github.com/dolthub/dolt.

This repository includes a small go program which is intended to update the
flake. By default, it updates the flake lockfile and the vendorHash for the tip
of dolt/main. To do so, just run:

```
nix develop -i -c 'dolt-nix-flake'
```

and checkin the result.

You can also update the flake to be for a given dolt release. To do so, run
something like:

```
nix develop -i -c dolt-nix-flake --revision '?ref=tags/v1.20.0'
```

The result should be pushed to release tag corresponding to the given dolt
release:

```
git add .
git commit -m 'Release v1.20.0'
git tag v1.20.0
git push origin v1.20.0
```

We hope to soon add CI machinery to update dolt-nix-flake with the new
flake.nix contents when dolt/main changes and when dolt publishes releases.
