module github.com/igor-lemon/websocket

go 1.25

retract v1.5.2 // tag accidentally overwritten

require (
	github.com/igor-lemon/fhttp v0.6.10-0.20261108185233-87f7dcb80e8a
	golang.org/x/net v0.38.0
)

require (
	github.com/andybalholm/brotli v1.2.7 // indirect
	github.com/cloudflare/circl v1.6.2 // indirect
	github.com/igor-lemon/utls v1.7.8-barnius.0.20261106190843-4b54ea578c9d
	github.com/klauspost/compress v1.20.2 // indirect
	golang.org/x/crypto v0.36.0 // indirect
	golang.org/x/sys v0.31.0 // indirect
	golang.org/x/text v0.23.0 // indirect
)

//replace github.com/igor-lemon/fhttp => ../fhttp

//replace github.com/bogdanfinn/utls => ../utls
