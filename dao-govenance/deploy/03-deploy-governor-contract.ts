import { HardhatRuntimeEnvironment } from "hardhat/types";
import { DeployFunction } from "hardhat-deploy/types";
import {
  QUORUM_PERCENTAGE,
  VOTING_DELAY,
  VOTING_PERIOD,
} from "../hardhat-helper-config";

const deployGovernorContract: DeployFunction = async (
  hre: HardhatRuntimeEnvironment
) => {
  const { getNamedAccounts, deployments, network } = hre;
  const { deploy, log, get } = deployments;
  const { deployer } = await getNamedAccounts();

  //get will help to import the alredy deployed contracts.
  //we will doploy these scripts in order because they need to get deployed.

  
  const governanceToken = await get("GovernanceToken");
  const timeLock = await get("TimeLock");

  log("Deploying the Governor contract...");
  const governorContract = await deploy("GovernorContract", {
    from: deployer,
    args: [
      governanceToken.address,
      timeLock.address,
      VOTING_DELAY,
      VOTING_PERIOD,
      QUORUM_PERCENTAGE,
    ],
    log: true,
    waitConfirmations: 1, // optional
  });

  log(`03-Deployed 'GovernorContract' at ${governorContract.address} `);
};

export default deployGovernorContract;
deployGovernorContract.tags = ["all", "governor"];
