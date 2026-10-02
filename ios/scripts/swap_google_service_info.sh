#!/usr/bin/env bash
#
# Copies the flavor-specific GoogleService-Info.plist into ios/Runner/ before
# build. Invoked by Makefile run-* / build-ios-* targets, *not* by Xcode build
# phases (we don't want it to silently run for non-flavored manual builds).
#
# Usage: ./ios/scripts/swap_google_service_info.sh development|production
set -euo pipefail

FLAVOR="${1:-}"
if [[ -z "${FLAVOR}" ]]; then
  echo "usage: $0 development|production" >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IOS_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
SRC="${IOS_DIR}/firebase/${FLAVOR}/GoogleService-Info.plist"
DST="${IOS_DIR}/Runner/GoogleService-Info.plist"

if [[ ! -f "${SRC}" ]]; then
  echo "✗ ${SRC} not found." >&2
  echo "  Run \`flutterfire configure\` for the ${FLAVOR} flavor first." >&2
  exit 1
fi

cp "${SRC}" "${DST}"
echo "✓ ${FLAVOR} GoogleService-Info.plist → ${DST}"
