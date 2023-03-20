import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:grock/grock.dart';
import 'package:mvvm_architecture/screens/change_notifier_page.dart';
import 'package:mvvm_architecture/screens/future_provider_page.dart';
import 'package:mvvm_architecture/screens/provider_page.dart';
import 'package:mvvm_architecture/screens/state_provider_page.dart';
import 'package:mvvm_architecture/screens/stream_provider_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CupertinoNavigationBar(
          middle: Text("Riverpod"),
        ),
        body: Padding(
          padding: 20.allP,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProviderScreen()),
                  );
                },
                title: "Provider",
              ),
              AppButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StateProviderScreen()),
                  );
                },
                title: "State Provider",
              ),
              AppButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FutureProviderScreen()),
                  );
                },
                title: "Future Provider",
              ),
              AppButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StreamProviderScreen()),
                  );
                },
                title: "Stream Provider",
              ),
              AppButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ChangeNotifierProviderScreen()),
                  );
                },
                title: "Change Notifier Provider",
              ),
            ],
          ),
        ));
  }
}

class AppButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 10.onlyTopP,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: Size(MediaQuery.of(context).size.width, 45),
            side: const BorderSide(
                width: 3.0, color: Colors.black), // Çerçeve rengi ve kalınlığı
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), // Köşe yuvarlatma
          ),
          onPressed: () {
            onPressed();
          },
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          )),
    );
  }
}
