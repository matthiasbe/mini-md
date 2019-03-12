BIN="$(pwd)/bin"
MAQAO_BIN="$BIN/maqao.intel64"
MINIMD_BIN="$BIN/miniMD_openmpi"

CONFIG_PATH="$(pwd)/config"

MINIMD_FLAGS="-i $CONFIG_PATH/in.lj.custom -t 2"

mkdir -p results

$MAQAO_BIN oneview \
	--config="$CONFIG_PATH/config.lua" \
	--create-report=one \
	binary="$MINIMD_BIN" \
	run_command="<binary> $MINIMD_FLAGS"
