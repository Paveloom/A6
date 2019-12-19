#!/bin/bash

# Название текстового файла
TEXT_FILE=functions

# Путь, где лежит файл модуля
SOURCE_PATH=./Исходники/Модуль/Входные_данные/Функции/

# Расширение файла модуля
PATTERN=f90

# Сборка полного пути к файлу модуля
MODULE_FULL_PATH=$SOURCE_PATH${TEXT_FILE}_m.$PATTERN

# Набор пробелов для отступа
SPACES="          "

# Проверка на существование исходного текстового файла

if [ ! -f $TEXT_FILE ]; then

     echo
     echo '     functions.sh:'
     echo '     Файл functions не был обнаружен. Используйте шаблон из репозитория.'
     echo

     exit

fi

# Проход по файлу модуля

# Задание начального значения счетчику строк
k=0

while IFS= read -r line || [ -n "$line" ]; do
    
     # Обновление счетчика строк
     k=$((k+1))

     # Функция p
     if [ $k -eq 15 ]; then

          P_MODULE_FUNCTION=$line

     # Функция q
     elif [ $k -eq 22 ]; then

          Q_MODULE_FUNCTION=$line

     # Функция f
     elif [ $k -eq 29 ]; then

          F_MODULE_FUNCTION=$line

     fi

done < $MODULE_FULL_PATH

# Проход по исходному текстовому файлу

# Задание начального значения счетчику строк
k=0

while IFS= read -r line || [ -n "$line" ]; do
    
     # Обновление счетчика строк
     k=$((k+1))

     # Функция p
     if [ $k -eq 2 ]; then

          P_FUNCTION=$line

     # Функция q
     elif [ $k -eq 5 ]; then

          Q_FUNCTION=$line

     # Функция f
     elif [ $k -eq 8 ]; then

          F_FUNCTION=$line

     fi

done < $TEXT_FILE

# Обновление, если необходимо, функций

if [ ! "$P_MODULE_FUNCTION" = "${SPACES}p = $P_FUNCTION" ]; then

     # Отмена специальных символов (*, -)

     P_MODULE_FUNCTION=$(echo "$P_MODULE_FUNCTION" | sed "s:\*:\\\*:g")
     P_MODULE_FUNCTION=$(echo "$P_MODULE_FUNCTION" | sed "s:\-:\\\-:g")
     
     # Функция p
     sed -i "15s/$P_MODULE_FUNCTION/${SPACES}p = $P_FUNCTION/" $MODULE_FULL_PATH

fi

if [ ! "$Q_MODULE_FUNCTION" = "${SPACES}q = $Q_FUNCTION" ]; then

     # Отмена специальных символов (*, -)

     Q_MODULE_FUNCTION=$(echo "$Q_MODULE_FUNCTION" | sed "s:\*:\\\*:g")
     Q_MODULE_FUNCTION=$(echo "$Q_MODULE_FUNCTION" | sed "s:\-:\\\-:g")

     # Функция q
     sed -i "22s/$Q_MODULE_FUNCTION/${SPACES}q = $Q_FUNCTION/" $MODULE_FULL_PATH

fi

if [ ! "$F_MODULE_FUNCTION" = "${SPACES}f = $F_FUNCTION" ]; then

     # Отмена специальных символов (*, -)

     F_MODULE_FUNCTION=$(echo "$F_MODULE_FUNCTION" | sed "s:\*:\\\*:g")
     F_MODULE_FUNCTION=$(echo "$F_MODULE_FUNCTION" | sed "s:\-:\\\-:g")

     # Функция f
     sed -i "29s/$F_MODULE_FUNCTION/${SPACES}f = $F_FUNCTION/" $MODULE_FULL_PATH

fi