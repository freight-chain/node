# Freight Trust Cascadia Node
# This is a blank node, meaning no additional functionality, e.g. exposed services like graphql
# Apache License 2.0, dervied from PegaSys Quickstart
# github.com/freight-chain/node/cascadia

node_id=`Freight-Trust-Cascadia`

PUBLIC_KEYS_DIR=${BESU_PUBLIC_KEY_DIRECTORY:=/opt/besu/public-keys/}
GENESIS_FILE_DIR=${BESU_GENESIS_FILE_DIRECTORY:=/opt/besu/genesis/}
DATA_DIR=${BESU_DATA_DIR:=/var/lib/besu/}
GENESIS_FILE=${GENESIS_FILE_DIR}genesis.json
BOOTNODE_ENODE_ADDRESS=enode://694c9cdd1a95ea242cf194d6e0738c44379446ed59abe1a34763dd48f700a3edf3f849b5b2127d38202583ec17eecee604d15d3c7bf83a86494c26571507400e@54.226.223.85:30305

BESU_BINARY="/opt/besu/bin/besu $@ --data-path=${DATA_DIR}"

PUBLIC_FILES_PATH_PREFIX=${PUBLIC_KEYS_DIR}${node_id}
${BESU_BINARY} public-key export --to="${PUBLIC_FILES_PATH_PREFIX}_pubkey"

# export address to be able to add this node as a validator
raw_address=`${BESU_BINARY} public-key export-address --to="${PUBLIC_FILES_PATH_PREFIX}_address"`

# remove database as exporting public keys init the db but we don't have the right genesis yet
rm -Rf ${DATA_DIR}/database

BOOTNODE_KEY_FILE="${PUBLIC_KEYS_DIR}bootnode_pubkey"

# sleep loop to wait for the public key file to be written
while [ ! -f $BOOTNODE_KEY_FILE ]
do
  echo "waiting for bootnode key file to be written"
  sleep 1
done

# sleep loop to wait for the genesis file to be written
while [ ! -f $GENESIS_FILE ]
do
  echo "waiting for genesis file to be written"
  sleep 1
done

# get bootnode enode address
bootnode_pubkey=`sed 's/^0x//' $BOOTNODE_KEY_FILE`
boonode_ip=`getent hosts bootnode | awk '{ print $1 }'`
BOOTNODE_P2P_PORT="30303"

bootnode_enode_address="enode://${bootnode_pubkey}@${boonode_ip}:${BOOTNODE_P2P_PORT}"

# run with bootnode param
${BESU_BINARY} --bootnodes=$bootnode_enode_address --genesis-file="${GENESIS_FILE}"