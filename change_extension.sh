#!/bin/bash

# Проверка на количество параметров
if [ $# -ne 2 ]; then
  echo "Usage: $0 <filename> <new_extension>"
  exit 1
fi

# Присвоение параметров переменным
filename="$1"
new_extension="$2"

# Проверка существования файла
if [ ! -f "$filename" ]; then
  echo "File not found: $filename"
  exit 1
fi

# Получение базового имени и директории
base_name=$(basename "$filename")
file_dir=$(dirname "$filename")

# Извлечение имени файла без расширения
file_name="${base_name%.*}"

# Проверка наличия расширения
if [ "$file_name" = "$base_name" ]; then
  echo "File has no extension. Adding new extension."
else
  echo "File has an extension. Changing to new extension."
fi

# Формирование нового имени файла
new_filename="$file_dir/$file_name.$new_extension"

# Переименование файла
mv "$filename" "$new_filename"

echo "File renamed to: $new_filename"
