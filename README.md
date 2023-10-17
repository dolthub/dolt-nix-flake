dolt-nix-flake
==============

A nix flake with a derivation for a build of github.com/dolthub/dolt.

This repository includes a small go program which is intended to update the
flake for a given commit of the dolthub/dolt repository. For now, you run it like:

```
go run . b6a077ceb9d7999d6af42e974b1b68b4a9cae38b
```

and it outputs on standard out the contents of a nix flake for building dolt at
that commit.

CI machinery periodically updates dolt-nix-flake with new flake.nix contents
reflecting more recent dolt development.
