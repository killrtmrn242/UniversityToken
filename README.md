
# UniversityToken

## Описание

**UniversityToken** — это проект смарт-контракта на основе токена ERC20, который использует стандарт OpenZeppelin для создания собственного токена, называемого `UniversityGroupToken` (UGT). Контракт позволяет отслеживать дату последней транзакции для каждого адреса и предоставляет возможность получения информации о владельцах токенов.

---

## Особенности проекта

- **ERC20 токен**: Этот контракт реализует стандарт ERC20 для токенов.
- **Отслеживание транзакций**: Контракт сохраняет временные метки последней транзакции для каждого адреса.
- **Получение информации о транзакциях**: Функция `getLastTransactionTimestamp` позволяет узнать дату последней транзакции для любого адреса.
- **Метод конвертации временной метки**: Временные метки транзакций преобразуются в удобный формат даты: день/месяц/год.

---

## Установка и развертывание

### 1. Установка необходимых зависимостей

Для начала работы с проектом, вам необходимо установить зависимости:

```bash
npm install
```

### 2. Конфигурация сети

Для развертывания контракта на тестовой сети Sepolia, вам нужно будет настроить `truffle-config.js` файл, указав RPC URL, ключ API для доступа к сети и приватный ключ аккаунта. Например:

```javascript
module.exports = {
  networks: {
    sepolia: {
      provider: () => new HDWalletProvider("YOUR_PRIVATE_KEY", "https://sepolia.infura.io/v3/YOUR_INFURA_PROJECT_ID"),
      network_id: 11155111,
      gas: 5000000,
      gasPrice: 10000000000,
    }
  },
  // другие настройки...
};
```

### 3. Миграция контракта

Для развертывания контракта на выбранной сети, выполните команду:

```bash
truffle migrate --network sepolia
```

### 4. Взаимодействие с контрактом

После успешного развертывания контракта, вы можете взаимодействовать с ним через Truffle консоль:

```bash
truffle console --network sepolia
```

Затем можно использовать методы контракта, например:

```javascript
let instance = await UniversityToken.deployed();
let timestamp = await instance.getLastTransactionTimestamp("0xAddress");
console.log(timestamp);
```

---

## Функции контракта

### 1. **getLastTransactionTimestamp(address account)**

Возвращает дату последней транзакции для указанного адреса в формате "день/месяц/год". Если транзакций не было, функция вызовет ошибку.

Пример использования:

```javascript
let timestamp = await contract.getLastTransactionTimestamp("0xAddress");
console.log(timestamp);  // Пример вывода: "12/04/2023"
```

### 2. **getTransactionSender(address account)**

Возвращает адрес, который владеет токенами на указанном аккаунте. Если аккаунт не имеет токенов, функция вызовет ошибку.

Пример использования:

```javascript
let sender = await contract.getTransactionSender("0xAddress");
console.log(sender);
```

---

## Структура файлов

```
.
├── contracts
│   ├── UniversityToken.sol       # Смарт-контракт токена
├── migrations
│   ├── 1_deploy_contracts.js     # Миграция контракта
├── truffle-config.js             # Конфигурация Truffle
├── package.json                  # Зависимости проекта
└── README.md                     # Этот файл
```

---

## Лицензия

Этот проект лицензирован под [MIT License](https://opensource.org/licenses/MIT).

