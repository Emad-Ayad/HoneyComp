import 'package:honey_comp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:honey_comp/core/helper_functions/paymob_constants.dart';

class PaymentWebView extends StatefulWidget {
  final String paymentKey;
  const PaymentWebView({super.key, required this.paymentKey});

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.contains('success=true')) {
              Navigator.pop(context, true); // Success
              return NavigationDecision.prevent;
            } else if (request.url.contains('success=false')) {
              Navigator.pop(context, false); // Failed
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://accept.paymob.com/api/acceptance/iframes/${PaymobConstants.iframeId}?payment_token=${widget.paymentKey}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).electronicPayment, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
