//includes individual wave tracker - uses userWaves in WavePortal.sol

const main = async () => {
  const [owner, randomPerson] = await hre.ethers.getSigners()
  const waveContractFactory = await hre.ethers.getContractFactory("WavePortal")
  const waveContract = await waveContractFactory.deploy()
  await waveContract.deployed()

  console.log("Contract deployed to:", waveContract.address)
  console.log("Contract deployed by:", owner.address)

  let waveCount = await waveContract.getTotalWaves()
  //console.log(waveCount.toNumber())

  let waveTxn = await waveContract.wave("i waved")
  await waveTxn.wait()
  waveTxn = await waveContract.wave("i waved 2")
  await waveTxn.wait()
  waveTxn = await waveContract.wave("i waved 3")
  await waveTxn.wait()

  waveTxn = await waveContract.connect(randomPerson).wave("i randomly waved")
  await waveTxn.wait()

  waveCount = await waveContract.getTotalWaves()

  let allWaves = await waveContract.getAllWaves()
  console.log(allWaves)

  let userWaves = await waveContract.getUserWaves(owner.address)
  console.log("Total waves for " + owner.address + " is " + userWaves)

  userWaves = await waveContract.getUserWaves(randomPerson.address)
  console.log("Total waves for " + randomPerson.address + " is " + userWaves)
}

const runMain = async () => {
  try {
    await main()
    process.exit(0)
  } catch (e) {
    console.log(e)
    process.exit(1)
  }
}

runMain()
