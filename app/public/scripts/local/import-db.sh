#!/usr/bin/env bash

set -euo pipefail

if [[ $# -lt 3 ]]; then
  echo "Usage: $0 /path/to/dump.sql(.gz) https://prod.example.com http://local.example.test"
  exit 1
fi

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
LOCAL_CONFIG_PATH="${PROJECT_ROOT}/local.php"
DUMP_PATH="$1"
SOURCE_URL="$2"
LOCAL_URL="$3"

if [[ ! -f "${LOCAL_CONFIG_PATH}" ]]; then
  echo "local.php est introuvable. Copie d'abord local.php.example vers local.php."
  exit 1
fi

if [[ ! -f "${DUMP_PATH}" ]]; then
  echo "Dump SQL introuvable : ${DUMP_PATH}"
  exit 1
fi

if ! command -v mysql >/dev/null 2>&1; then
  echo "Le client mysql n'est pas installé. Installe-le (ex: brew install mysql-client) ou importe le dump via Sequel Ace / TablePlus."
  exit 1
fi

if ! command -v wp >/dev/null 2>&1; then
  echo "WP-CLI est requis pour le search-replace."
  exit 1
fi

db_value() {
  php -r '$config = require $argv[1]; echo $config[$argv[2]] ?? $argv[3];' "${LOCAL_CONFIG_PATH}" "$1" "$2"
}

DB_NAME="$(db_value db_name pepseeactus_local)"
DB_USER="$(db_value db_user root)"
DB_PASSWORD="$(db_value db_password root)"
DB_HOST="$(db_value db_host 127.0.0.1)"

MYSQL_ARGS=(-h"${DB_HOST}" -u"${DB_USER}")
if [[ -n "${DB_PASSWORD}" ]]; then
  MYSQL_ARGS+=(-p"${DB_PASSWORD}")
fi

echo "Creating database ${DB_NAME} if needed..."
mysql "${MYSQL_ARGS[@]}" -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

echo "Importing ${DUMP_PATH}..."
if [[ "${DUMP_PATH}" == *.gz ]]; then
  gunzip -c "${DUMP_PATH}" | mysql "${MYSQL_ARGS[@]}" "${DB_NAME}"
else
  mysql "${MYSQL_ARGS[@]}" "${DB_NAME}" < "${DUMP_PATH}"
fi

echo "Running WordPress search-replace..."
(
  cd "${PROJECT_ROOT}"
  wp search-replace "${SOURCE_URL}" "${LOCAL_URL}" --all-tables --skip-columns=guid
  wp option update home "${LOCAL_URL}"
  wp option update siteurl "${LOCAL_URL}"
  wp rewrite flush
)

echo "Local import complete."
