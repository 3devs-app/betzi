#!/bin/sh
brew install mint
mint bootstrap -m ../Mintfile

cat > ../Betzi/Configs/Environment/Confg-${CONFIGURATION}.xcconfig << 'EOF'
BASE_URL = ${API_KEY}
API_KEY ${BASE_URL}
EOF
