import 'package:citisers/utils/constants.dart';
import 'package:web3dart/web3dart.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<DeployedContract> loadContract() async {
  String abi = await rootBundle.loadString("assets/abi.json");
  String contractAddress = contractAddress1;
  final contract = DeployedContract(ContractAbi.fromJson(abi, "UserData"),
      EthereumAddress.fromHex(contractAddress));
  return contract;
}

Future<String> callFunction(String functionName, List<dynamic> args,
    Web3Client ethClient, String privateKey) async {
  EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
  DeployedContract contract = await loadContract();
  final ethFunction = contract.function(functionName);
  final result = await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: ethFunction,
        parameters: args,
      ),
      chainId: null,
      fetchChainIdFromNetworkId: true);
  return result;
}

Future<String> addToBlockchain(String name, String vehicleNumber,
    String licenseNo, int mobileNumber, Web3Client ethClient) async {
  // Web3Client ethClient = Web3Client(infura_url, httpClient);
  var response = await callFunction("addToBlockchain",
      [name, vehicleNumber, mobileNumber, licenseNo], ethClient, private_key);
  // print("Data uploaded to blockchain");
  return response;
}

Future<String> getData(Web3Client ethClient) async {
  // Web3Client ethClient = Web3Client(infura_url, httpClient);
  var response = await callFunction("getData", [], ethClient, private_key);
  // print("Data fetched from blockchain");
  return response;
}
