#!/usr/bin/env bash
# Неофициальный установщик zapret-rust (https://github.com/Sergeydigl3/zapret-discord-youtube-rust)
set -euo pipefail

VERSION="${VERSION:-v2.2.0}"
BIN_NAME="zapret-rust-linux-x86_64"
URL="https://github.com/Sergeydigl3/zapret-discord-youtube-rust/releases/download/zapret-rust-${VERSION}/${BIN_NAME}"

INSTALL_DIR="$HOME/.local/opt/zapret-rust"
BIN_DIR="$HOME/.local/bin"
LINK="$BIN_DIR/zapret-rust"

# Проверка архитектуры
if [ "$(uname -m)" != "x86_64" ]; then
    echo "Ошибка: бинарник собран только для x86_64, у вас $(uname -m)" >&2
    exit 1
fi

mkdir -p "$INSTALL_DIR" "$BIN_DIR"

# Скачиваем во временный файл, чтобы не оставить битый бинарник при обрыве
TMP="$(mktemp)"
trap 'rm -f "$TMP"' EXIT

echo "Скачивание zapret-rust ${VERSION}..."
if command -v wget >/dev/null 2>&1; then
    wget -q --show-progress -O "$TMP" "$URL"
elif command -v curl >/dev/null 2>&1; then
    curl -fL --progress-bar -o "$TMP" "$URL"
else
    echo "Ошибка: нужен wget или curl" >&2
    exit 1
fi

install -m 755 "$TMP" "$INSTALL_DIR/$BIN_NAME"
ln -sf "$INSTALL_DIR/$BIN_NAME" "$LINK"

# Добавляем ~/.local/bin в PATH, только если его там нет
case ":$PATH:" in
    *":$BIN_DIR:"*) ;;
    *)
        if ! grep -qs '\.local/bin' "$HOME/.bashrc" "$HOME/.profile" 2>/dev/null; then
            echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
            echo "PATH добавлен в ~/.bashrc. Выполните: source ~/.bashrc"
        else
            echo "~/.local/bin уже прописан в конфиге оболочки. Перезапустите терминал."
        fi
        ;;
esac

echo "Готово. Установлено в: $INSTALL_DIR"
echo "Запуск: zapret-rust (при необходимости через sudo, см. README)"
