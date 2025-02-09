async function main() {
  // Убедитесь, что контракт адрес указан корректно (замените на реальный адрес)
  const contractAddress = "0x75171ed1C91282699FA2c779E29e1eBA93f86498"; 
  const token = await ethers.getContractAt("UniversityToken", contractAddress);

  // Проверяем начальные данные о последней транзакции.
  let info = await token.getLastTransactionInfo();
  console.log("Initial transaction info:", info);
  
  // Получаем аккаунты
  const [deployer] = await ethers.getSigners();

  // Выполняем перевод токенов самому себе
  const tx = await token.transfer(deployer.address, ethers.utils.parseUnits("10", 18));
  console.log("Transfer transaction sent, waiting for confirmation...");
  await tx.wait();

  // Проверяем обновлённую информацию о последней транзакции.
  info = await token.getLastTransactionInfo();
  console.log("After transfer, transaction info:", info);

  const lastSender = await token.getLastTransactionSender();
  const lastReceiver = await token.getLastTransactionReceiver();
  const latestTimestamp = await token.getLatestTransactionDateTime();

  console.log("Last Transaction Sender:", lastSender);
  console.log("Last Transaction Receiver:", lastReceiver);
  console.log("Latest Transaction Timestamp:", latestTimestamp);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
