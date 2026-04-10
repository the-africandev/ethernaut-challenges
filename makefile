-include .env

balance-wei:
	cast balance $(ADDRESS) --rpc-url $(SEPOLIA_RPC_URL)

balance-eth:
	cast balance $(ADDRESS) --rpc-url $(SEPOLIA_RPC_URL) --ether
