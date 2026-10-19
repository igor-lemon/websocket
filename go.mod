module github.com/igor-lemon/websocket

go 1.24.1

retract v1.5.2 // tag accidentally overwritten

require (
	github.com/igor-lemon/fhttp v0.6.10-0.20261019141341-bd9ea92137d1
	golang.org/x/net v0.38.0
)

require (
	github.com/andybalholm/brotli v1.1.1 // indirect
	github.com/cloudflare/circl v1.6.2 // indirect
	github.com/igor-lemon/utls v1.7.8-barnius.0.20261019134924-8ce0abf27ca1
	github.com/klauspost/compress v1.17.11 // indirect
	golang.org/x/crypto v0.36.0 // indirect
	golang.org/x/sys v0.31.0 // indirect
	golang.org/x/text v0.23.0 // indirect
)

//replace github.com/igor-lemon/fhttp => ../fhttp

//replace github.com/bogdanfinn/utls => ../utls
