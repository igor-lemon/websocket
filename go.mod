module github.com/igor-lemon/websocket

go 1.24.1

retract v1.5.2 // tag accidentally overwritten

require (
	github.com/igor-lemon/fhttp v0.6.10-0.20261019184028-b7e6bbf2d6dd
	golang.org/x/net v0.38.0
)

require (
	github.com/andybalholm/brotli v1.1.1 // indirect
	github.com/cloudflare/circl v1.6.2 // indirect
	github.com/igor-lemon/utls v1.7.8-barnius.0.20261019181339-54318cac598d
	github.com/klauspost/compress v1.17.11 // indirect
	golang.org/x/crypto v0.36.0 // indirect
	golang.org/x/sys v0.31.0 // indirect
	golang.org/x/text v0.23.0 // indirect
)

//replace github.com/igor-lemon/fhttp => ../fhttp

//replace github.com/bogdanfinn/utls => ../utls
