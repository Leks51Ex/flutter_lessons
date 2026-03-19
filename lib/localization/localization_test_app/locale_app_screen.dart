import 'package:flutter/material.dart';
import 'package:flutter_stepik/localization/l10n/gen/app_localizations.dart';

class LocaleAppScreen extends StatefulWidget {
  final VoidCallback onLocaleToggle;

  const LocaleAppScreen({super.key, required this.onLocaleToggle});

  @override
  State<LocaleAppScreen> createState() => _LocaleAppScreenState();
}

class _LocaleAppScreenState extends State<LocaleAppScreen> {
  int _counter = 0;
  final _nameController = TextEditingController();
  String? _greeting;

  _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _updateGreeting(AppLocalizations localizations) {
    if (_nameController.text.trim().isNotEmpty) {
      setState(() {
        _greeting = localizations.hello(_nameController.text.trim());
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_greeting != null && _nameController.text.trim().isNotEmpty) {
      _updateGreeting(AppLocalizations.of(context));
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.title),
        actions: [
          IconButton(
            onPressed: widget.onLocaleToggle,
            icon: Icon(Icons.language),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: localizations.nameHint,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      _updateGreeting(localizations);
                    },
                    child: Text(localizations.send),
                  ),
                ],
              ),
              if (_greeting != null) ...[
                const SizedBox(height: 16),
                Text(
                  _greeting!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
              SizedBox(height: 24),
              Text(
                localizations.pizzaName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                localizations.pizzaIngredients,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                localizations.orderPizzaButton(_counter),
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  _incrementCounter();
                },
                child: Text(localizations.orderPizza(_counter)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
