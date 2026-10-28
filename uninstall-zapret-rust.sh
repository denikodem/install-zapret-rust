#!/usr/bin/env bash
# Удаление zapret-rust, установленного через install-zapret-rust.sh
set -euo pipefail

rm -f "$HOME/.local/bin/zapret-rust"
rm -rf "$HOME/.local/opt/zapret-rust"

echo "zapret-rust удалён."
echo "Строку PATH в ~/.bashrc скрипт не трогает: она безвредна, удалите вручную при желании."
