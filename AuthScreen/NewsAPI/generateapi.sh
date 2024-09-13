#!/bin/bash

# Укажите директорию для генерации клиента
OUTPUT_DIR="/Users/nikitagulaev/Desktop/Pp/Ex/AuthScreen/AuthScreen/NewsAPI"

# Укажите путь к спецификации OpenAPI
SPEC_FILE="/Users/nikitagulaev/Desktop/Pp/Ex/AuthScreen/AuthScreen/NewsAPI/newsapi.yaml"
# Создайте директорию для сгенерированного кода, если она не существует
mkdir -p "$OUTPUT_DIR"

# Генерация кода
openapi-generator generate -i "$SPEC_FILE" -g swift5 -o "$OUTPUT_DIR"

echo "Client code has been generated in the $OUTPUT_DIR directory."
