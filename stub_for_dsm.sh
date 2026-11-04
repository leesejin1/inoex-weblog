#!/bin/sh
# INOex 웹하드 자동 수집 — 매일 새벽 최신 코드를 받아 실행합니다 (사용자: root)
U="${U:-https://raw.githubusercontent.com/leesejin1/inoex-weblog/main/inoex_webhard_setup.sh}"
B="${BASE:-/volume1/docker/inoex-webhard}"; mkdir -p "$B"; T="$B/.setup_latest.sh"
if curl -fsSL --max-time 120 -o "$T.new" "$U" 2>/dev/null && head -3 "$T.new" | grep -q INOEX_SETUP_V1; then mv "$T.new" "$T"
else rm -f "$T.new"; echo "경고: 새 코드를 내려받지 못해 마지막으로 받은 코드로 실행합니다"; fi
[ -f "$T" ] || { echo "코드를 받은 적이 없고 내려받기도 실패했습니다 (NAS 의 인터넷 연결·주소 확인)"; echo "RESULT: FAIL"; exit 1; }
exec sh "$T"
