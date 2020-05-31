# <img src="header.png" alt="Freight Trust Cascadia Client" height="60px">

<pre>
	@version: 20.1
	@maintainer: freight-trust
	@license: apache 2.0
</pre>

## Docker Container
### [For Official Documentation](https://besu.hyperledger.org/en/stable/HowTo/Get-Started/Run-Docker-Image/)

Hyperledger/Besu Container with freight-trust main-net connection
https://hub.docker.com/repository/docker/freightclear/cascadia

Example Command:
`docker run -p <localportJSON-RPC>:8545 -p <localportWS>:8546 -p <localportP2P>:30303 hyperledger/besu:latest --rpc-http-enabled --rpc-ws-enabled`

---
(c) 2020 FreightTrust & Clearing Corporation. All Rights Reserved.
