module github.com/igor-lemon/websocket

go 1.27

retract v1.5.2 // tag accidentally overwritten

require (
	github.com/igor-lemon/fhttp v0.6.10-0.20261111153518-df863b5b1da8
	github.com/igor-lemon/utls v1.7.8-barnius.0.20261109230756-6be0e3da4e2d
	golang.org/x/net v0.59.0
)

require (
	github.com/andybalholm/brotli v1.2.7 // indirect
	github.com/klauspost/compress v1.20.2 // indirect
	golang.org/x/crypto v0.57.0 // indirect
	golang.org/x/sys v0.48.0 // indirect
	golang.org/x/text v0.42.0 // indirect
)

//replace github.com/igor-lemon/fhttp => ../fhttp

//replace github.com/bogdanfinn/utls => ../utls
