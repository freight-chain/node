#!/bin/bash
set -euo pipefail
TEMP=`mktemp -d`

function cleanup() {
	rm -rf "$TEMP"
}
trap cleanup EXIT

VERSION=${1?Must specify the besu version to get}
URL="https://dl.bintray.com/hyperledger-org/besu-repo/besu-$VERSION.zip"
echo "Downloading version $VERSION of besu from $URL..."
curl -o "$TEMP/besu-$VERSION.zip" -L --fail "$URL"

unzip -t "$TEMP/besu-$VERSION.zip"

echo "Calculating new hash..."
HASH=`shasum -a 256 "$TEMP/besu-$VERSION".zip | cut -d ' ' -f 1`

cat > besu.rb <<EOF
class Besu < Formula
  desc "hyperledger besu ethereum client"
  homepage "https://github.com/hyperledger/besu"
  url "${URL}"
  # update with: ./updateBesu.sh <new-version>
  sha256 "${HASH}"

  depends_on :java => "11+"

  def install
    prefix.install "lib"
    bin.install "bin/besu"
  end

  test do
    system "#{bin}/besu" "--version"
  end
end
EOF

echo "New url: $URL"
echo "New hash: $HASH"
echo "Success.  Commit the changes to besu.rb to release."