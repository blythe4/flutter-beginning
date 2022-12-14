import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:newflutter/utils/helperfunctions.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slider_button/slider_button.dart';
// import 'package:flutter_logs/flutter_logs.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
          name: 'My MMCApp',
          description: 'An app for converting pictures to NFT',
          url: 'https://walletconnect.org',
          icons: [
            'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
          ]));

  var _session, _uri, _signature;

  loginUsingMetamask(BuildContext context) async {
    if (!connector.connected) {
      try {
        var session = await connector.createSession(
            chainId: 137,
            onDisplayUri: (uri) async {
              _uri = uri;
              print(uri);
              // FlutterLogs.logInfo("loginMetamask Button", "get uri", uri);
              try {
                await launchUrl(Uri.parse(uri),
                    mode: LaunchMode.platformDefault);
                // FlutterLogs.logInfo(
                //     "Metamask App Connect", "Connect", "Connect");
              } catch (exp) {
                // metamask App install
                if (Platform.isAndroid) {
                  // Android-specific code
                  await launchUrl(
                      Uri.parse(
                          'https://play.google.com/store/apps/details?id=io.metamask&hl=ko&gl=US'),
                      mode: LaunchMode.externalApplication);
                } else if (Platform.isIOS) {
                  // iOS-specific code
                  await launchUrl(
                      Uri.parse(
                          'https://apps.apple.com/us/app/metamask-blockchain-wallet/id1438144202'),
                      mode: LaunchMode.externalApplication);
                }
                print(exp);
              }
            });
        print(session);
        setState(() {
          _session = session;
        });
      } catch (exp) {
        print(exp);
      }
    }
  }

  signMessageWithMetamask(BuildContext context, String message) async {
    if (connector.connected) {
      try {
        print("Message received");
        print(message);

        EthereumWalletConnectProvider provider =
            EthereumWalletConnectProvider(connector);
        launchUrlString(_uri, mode: LaunchMode.platformDefault);
        var signature = await provider.personalSign(
            message: message, address: _session.accounts[0], password: "");
        print(signature);
        setState(() {
          _signature = signature;
        });
      } catch (exp) {
        print("Error while signing transaction");
        print(exp);
      }
    }
  }

  disconnectMetamask() {
    if (connector.connected) {
      _session = null;
      connector.killSession();
      connector = WalletConnect(
          bridge: 'https://bridge.walletconnect.org',
          clientMeta: const PeerMeta(
              name: 'My MMCApp',
              description: 'An app for converting pictures to NFT',
              url: 'https://walletconnect.org',
              icons: [
                'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
              ]));
    }
  }

  changeNetwork() async {
    await connector.updateSession(
        SessionStatus(chainId: 137, accounts: _session.accounts[0]));
    print('changeNetwork1');
    // connector.approveSession(accounts: _session.accounts, chainId: 137);
    print('changeNetwork2');
  }

  getNetworkName(chainId) {
    switch (chainId) {
      case 1:
        return 'Ethereum Mainnet';
      case 3:
        return 'Ropsten Testnet';
      case 4:
        return 'Rinkeby Testnet';
      case 5:
        return 'Goreli Testnet';
      case 42:
        return 'Kovan Testnet';
      case 137:
        return 'Polygon Mainnet';
      case 80001:
        return 'Mumbai Testnet';
      default:
        return 'Unknown Chain';
    }
  }

  @override
  Widget build(BuildContext context) {
    connector.on(
        'connect',
        (session) => setState(
              () {
                print('============== [connect] ==============');
                _session = _session;
              },
            ));
    connector.on(
        'session_update',
        (payload) => setState(() {
              _session = payload;
              print('============== [session_update] ==============');
              print(_session.accounts[0]);
              print(_session.chainId);
            }));
    connector.on(
        'disconnect',
        (payload) => setState(() {
              print('============== [disconnect] ==============');
              _session = null;
            }));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/main_page_image.png',
              fit: BoxFit.fitHeight,
            ),
            (_session != null)
                ? Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () => disconnectMetamask(),
                                  child:
                                      const Text("Disconnect with Metamask")),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () => changeNetwork(),
                                  child: const Text("Change Network")),
                            ],
                          ),
                          Text(
                            'Account',
                            style: GoogleFonts.merriweather(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            '${_session.accounts[0]}',
                            style: GoogleFonts.inconsolata(fontSize: 16),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                'Chain: ',
                                style: GoogleFonts.merriweather(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                getNetworkName(_session.chainId),
                                style: GoogleFonts.inconsolata(fontSize: 16),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          (_session.chainId != 80001)
                              ? Row(
                                  children: const [
                                    Icon(Icons.warning,
                                        color: Colors.redAccent, size: 15),
                                    Text('Network not supported. Switch to '),
                                    Text(
                                      'Mumbai Testnet',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              : (_signature == null)
                                  ? Container(
                                      alignment: Alignment.center,
                                      child: ElevatedButton(
                                          onPressed: () =>
                                              signMessageWithMetamask(
                                                  context,
                                                  generateSessionMessage(
                                                      _session.accounts[0])),
                                          child: const Text('Sign Message')),
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Signature: ",
                                              style: GoogleFonts.merriweather(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                                truncateString(
                                                    _signature.toString(),
                                                    4,
                                                    2),
                                                style: GoogleFonts.inconsolata(
                                                    fontSize: 16))
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        SliderButton(
                                          action: () async {
                                            // TODO: Navigate to main page
                                            print('slide');
                                          },
                                          label: const Text('Slide to login'),
                                          icon: const Icon(Icons.check),
                                        )
                                      ],
                                    )
                        ]))
                : ElevatedButton(
                    onPressed: () => loginUsingMetamask(context),
                    child: const Text("Connect with Metamask"))
          ],
        ),
      ),
    );
  }
}
