async function main() {
    // Получаем аккаунты из провайдера ethers
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);
  
    // Вывод баланса аккаунта
    const balance = await deployer.getBalance();
    console.log("Account balance:", balance.toString());
  
    // Получаем фабрику контракта
    const Token = await ethers.getContractFactory("UniversityToken");
    // Деплой контракта
    const token = await Token.deploy();
  
    console.log("Token deployed to:", token.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });
  