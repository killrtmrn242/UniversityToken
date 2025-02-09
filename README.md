# UniversityName_GroupNameToken

Это проект кастомного ERC‑20 токена, реализованного с использованием Hardhat и Solidity. Токен имеет начальное количество 2000 токенов и включает дополнительные функции для получения информации о последней транзакции (отправитель, получатель, сумма, временная метка).

## Содержание

- [Установка](#установка)
- [Структура проекта](#структура-проекта)
- [Конфигурация](#конфигурация)
- [Компиляция](#компиляция)
- [Деплой контракта](#деплой-контракта)
- [Тестирование функций](#тестирование-функций)
- [Дополнительные замечания](#дополнительные-замечания)
- [Лицензия](#лицензия)

## Установка

1. **Клонируйте репозиторий:**

   ```bash
   git clone <URL_вашего_репозитория>
   cd ass3-blockchain
   ```

2. **Установите зависимости:**

   ```bash
   npm install
   ```

   Проект использует следующие пакеты:
   - Hardhat
   - @nomicfoundation/hardhat-ethers (для работы с ethers v6)
   - ethers
   - dotenv

## Структура проекта

```
ass3-blockchain/
├── contracts/
│   ├── UniversityName_GroupNameToken.sol    # Контракт вашего ERC‑20 токена
│   └── Lock.sol                              # Дополнительный контракт (если используется)
├── scripts/
│   ├── deploy.js                             # Скрипт для деплоя контракта
│   └── testFunctions.js                      # Скрипт для тестирования функций контракта
├── .env                                      # Файл с переменными окружения (не включать в публичные репозитории)
├── hardhat.config.js                         # Конфигурация Hardhat
└── package.json
```

## Конфигурация

Создайте в корне проекта файл `.env` и укажите в нём следующие переменные:

```dotenv
PRIVATE_KEY=ваш_приватный_ключ_от_MetaMask
SECOND_PRIVATE_KEY=ваш_второй_приватный_ключ_если_нужен_для_тестирования
HOLESKY_RPC_URL=https://rpc.holesky.example  # Замените на актуальный RPC URL для тестовой сети Holesky
```

**Внимание:** Никогда не публикуйте свои приватные ключи!

## Компиляция

Для компиляции смарт-контрактов выполните:

```bash
npx hardhat compile
```

Убедитесь, что версия компилятора, указанная в `hardhat.config.js`, соответствует директиве `pragma` в ваших контрактах.

## Деплой контракта

Чтобы задеплоить контракт на тестовой сети Holesky, выполните:

```bash
npx hardhat run scripts/deploy.js --network holesky
```

После успешного деплоя в консоли отобразится адрес задеплоенного контракта.

## Тестирование функций

Чтобы проверить работу функций контракта:

1. **Обновите адрес контракта:**  
   Откройте файл `scripts/testFunctions.js` и замените строку с placeholder'ом (например, `"0xВашЗадеплоенныйАдресКонтракта"`) на реальный адрес, полученный при деплое.

2. **Запустите тестовый скрипт:**

   ```bash
   npx hardhat run scripts/testFunctions.js --network holesky
   ```

Скрипт выполняет следующие шаги:
- Получает и выводит начальную информацию о последней транзакции.
- Выполняет перевод токенов (например, 10 токенов) с одного аккаунта на другой.
- После подтверждения транзакции снова получает и выводит обновлённую информацию (отправитель, получатель, сумма и временная метка).

## Дополнительные замечания

- **MetaMask:** Убедитесь, что MetaMask настроен на тестовую сеть Holesky и на вашем аккаунте достаточно тестовых монет для оплаты газа.
- **Версии библиотек:** Проект использует ethers v6. Некоторые методы изменены по сравнению с предыдущими версиями (например, для получения адреса контракта используется `token.target` или метод `getAddress()`).
- **Тестирование:** Для более автоматизированного тестирования можно написать unit-тесты в каталоге `test/` и запускать их с помощью команды `npx hardhat test`.

## Лицензия

Этот проект лицензирован по лицензии MIT.
```
