#!/bin/bash

# Настройки базы данных
DB_PORT="5432"
DB_NAME="kanban"
DB_USER="kanban"
DB_PASSWORD="kanban"

# Настройки резервной копии
BACKUP_DIR="/var/backup/postgres"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_backup_${TIMESTAMP}.sql"

# Создание директории для резервных копий, если ее нет
mkdir -p "$BACKUP_DIR"

# Установка пароля через переменную окружения PGPASSWORD
export PGPASSWORD="$DB_PASSWORD"

# Выполнение резервного копирования
pg_dump -h "localhost" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -f "$BACKUP_FILE"

# Отмена экспорта переменной окружения для безопасности
unset PGPASSWORD

if [ $? -eq 0 ]; then
    echo "Резервная копия базы данных $DB_NAME успешно создана в файле $BACKUP_FILE"
else
    echo "Ошибка при создании резервной копии базы данных $DB_NAME"
    exit 1
fi
