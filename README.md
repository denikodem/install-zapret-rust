# install-zapret-rust

Неофициальный установщик [zapret-rust](https://github.com/Sergeydigl3/zapret-discord-youtube-rust) для Linux (x86_64).

Скрипт скачивает официальный релиз с GitHub автора, кладёт его в `~/.local/opt/zapret-rust` и создаёт команду `zapret-rust` в `~/.local/bin`. Права root для установки не нужны.

> Этот репозиторий не связан с автором zapret-rust. Бинарник не хранится здесь, он скачивается с официальной страницы релизов.

## Установка

Рекомендуемый способ: скачать, прочитать, запустить.

```bash
curl -fsSLO https://raw.githubusercontent.com/denikodem/install-zapret-rust/main/install-zapret-rust.sh
less install-zapret-rust.sh
bash install-zapret-rust.sh
```

Быстрый способ (запуск без чтения, используйте только если доверяете источнику):

```bash
curl -fsSL https://raw.githubusercontent.com/denikodem/install-zapret-rust/main/install-zapret-rust.sh | bash
```

Если скрипт дописал PATH в `~/.bashrc`, примените изменения:

```bash
source ~/.bashrc
```

## Запуск

```bash
zapret-rust
```

Программы обхода DPI обычно работают с nftables/iptables и требуют root. Если нужен `sudo`, учтите, что у него свой `secure_path`, и команда может не найтись. Тогда запускайте с полным путём:

```bash
sudo ~/.local/bin/zapret-rust
```

Актуальные параметры и требования смотрите в README оригинального проекта.

## Другая версия

По умолчанию ставится версия, указанная в переменной `VERSION` в начале скрипта. Можно задать другую без правки файла:

```bash
VERSION=v2.2.0 bash install-zapret-rust.sh
```

Повторный запуск скрипта обновляет бинарник.

## Удаление

```bash
bash uninstall-zapret-rust.sh
```

Скрипт удаляет бинарник и симлинк. Строку PATH в `~/.bashrc` он не трогает.

## Требования

- Linux x86_64
- `wget` или `curl`
- bash

## Лицензия

MIT, относится только к скриптам этого репозитория. Лицензия zapret-rust определяется его автором.
