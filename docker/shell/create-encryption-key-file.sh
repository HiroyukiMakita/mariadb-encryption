#!/usr/bin/env bash
source .env
HOST_ENCRYPTION_KEY_DIR=${HOST_ENCRYPTION_KEY_DIR}
HOST_ENCRYPTION_KEY_FILE=${HOST_ENCRYPTION_KEY_FILE}
PLAIN_ENCRYPTION_KEY_FILE="$HOST_ENCRYPTION_KEY_DIR"/plainkeyfile
HOST_ENCRYPTION_KEY_FILE_KEY=${HOST_ENCRYPTION_KEY_FILE_KEY}

# MariaDB の暗号化キーファイルを（無かったら）生成
# https://mariadb.com/kb/en/file-key-management-encryption-plugin/#creating-the-key-file
if [ ! -e "$HOST_ENCRYPTION_KEY_FILE" ]; then
  # 暗号化キーファイルの作成
  mkdir -p "$HOST_ENCRYPTION_KEY_DIR"
  (
    echo -n "1;"
    openssl rand -hex 32
  ) | sudo tee -a "$PLAIN_ENCRYPTION_KEY_FILE"
  (
    echo -n "2;"
    openssl rand -hex 32
  ) | sudo tee -a "$PLAIN_ENCRYPTION_KEY_FILE"

  # 暗号化キーファイルの暗号化パスワード
  sudo openssl rand -hex 128 > "$HOST_ENCRYPTION_KEY_FILE_KEY"

  # 暗号化キーファイルの暗号化
  sudo openssl enc -aes-256-cbc -md sha1 \
     -pass file:"$HOST_ENCRYPTION_KEY_FILE_KEY" \
     -in "$PLAIN_ENCRYPTION_KEY_FILE" \
     -out "$HOST_ENCRYPTION_KEY_FILE"

  rm "$PLAIN_ENCRYPTION_KEY_FILE"

  printf "\e[44m %s \e[00m\n" "Created encryption key file."
else
  printf "\e[34m %s \e[00m\n" "Encryption key file is exists."
fi
