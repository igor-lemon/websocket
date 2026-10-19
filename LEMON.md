# websocket for tls-forge

A fork of [bogdanfinn/websocket](https://github.com/bogdanfinn/websocket)
v1.5.6-barnius (`b96da2d51b4a117b6677587022fa4c59ca56629d`), on the branch
`tls-forge`, for [tls-forge](https://github.com/Sec-CH-Lemon/tls-forge).

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
