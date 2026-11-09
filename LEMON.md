# websocket for tls-forge

A fork of [bogdanfinn/websocket](https://github.com/bogdanfinn/websocket)
v1.5.6-barnius (`b96da2d51b4a117b6677587022fa4c59ca56629d`), its patches laid
over v1.5.9-barnius since 2026-11-10 (below), on the branch `tls-forge`, for
[tls-forge](https://github.com/Sec-CH-Lemon/tls-forge).

- The module is `github.com/igor-lemon/websocket`, and it imports fhttp and
  utls as `github.com/igor-lemon/fhttp` and `github.com/igor-lemon/utls`, the
  forks tls-forge patches: tls-client hands their types to this module, so
  both have to name the same ones. On another base:

      grep -rlE 'github\.com/bogdanfinn/(fhttp|utls|websocket)' --include='*.go' --include=go.mod . |
        xargs perl -pi -e 's#github\.com/bogdanfinn/(fhttp|utls|websocket)\b#github.com/igor-lemon/$1#g'

  then `git diff --name-only -- '*.go' | xargs gofmt -w`, which puts the
  renamed imports back in order, `go mod edit
  -require=github.com/igor-lemon/fhttp@<version>
  -require=github.com/igor-lemon/utls@<version>` and `go mod tidy`.

- Upstream's v1.5.9-barnius (`ee84921`) is merged (2026-11-09): dependency
  updates and `go 1.27`, which this module does not take (its `go` line is
  what its dependencies ask), and the proxy test's tunnel read through the
  hijacked buffer, which may hold the client's first bytes.

## The branch: bogdanfinn's release, then the patches (2026-11-10)

`git log --first-parent v1.5.9-barnius..tls-forge` lists the branch as it is
laid out: bogdanfinn's v1.5.9-barnius (`ee84921a2faa`), then "Rename the
module ...", the rename above, made by a script (the five forks' module paths
in every Go file and go.mod, imports sorted), then this fork's patches, one
commit a change, oldest first, as this file tells them. A merge on top, `-s
ours`, joins the branch's earlier head: the branch only ever moves forward,
every commit a published pin names stays in it, and the merge's tree is the
last patch's.

On 2026-11-10 the history to then (18 patches written over v1.5.6-barnius, and
the merge of v1.5.9-barnius of 2026-11-09) was laid over v1.5.9-barnius so:
each patch cherry-picked over the renamed release, a conflict resolved toward
the merge's tree, and what the merge itself had resolved put into the patch it
belongs to. The last patch's tree is the merge's, byte for byte, but for this
section. Every commit of the series builds and passes go vet over the series
of utls and fhttp.

To take another release of bogdanfinn's, with tls-forge's
`scripts/fork_sync.py`, in a clone (this checkout is not touched):

    python3 scripts/fork_sync.py start ../forks/websocket vX.Y.Z --work /tmp/websocket-sync
    # a conflict stops it: resolve it, git add, then
    python3 scripts/fork_sync.py continue --work /tmp/websocket-sync
    # what has to change for it to build, made in the clone, goes into the
    # patch whose lines it touches (or the one --to "SUBJECT=PATH" names)
    python3 scripts/fork_sync.py absorb --work /tmp/websocket-sync
    python3 scripts/fork_sync.py check --work /tmp/websocket-sync --with ...
    python3 scripts/fork_sync.py finish --work /tmp/websocket-sync -m "Patches laid over vX.Y.Z"

then `git merge --ff-only` of the clone's head on this branch. A conflict that
only moves an import the rename changed settles itself; git rerere keeps the
others; go.mod is merged module by module (the higher version) and go.sum by
union. The forks go in tls-forge's order: utls, fhttp, websocket and
quic-go-utls, tls-client; `check --with` builds a fork against the new series
of the ones before it.
