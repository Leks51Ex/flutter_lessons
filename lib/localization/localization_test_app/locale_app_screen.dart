import 'package:flutter/material.dart';
import 'package:flutter_stepik/localization/l10n/gen/app_localizations.dart';

class LocaleAppScreen extends StatefulWidget {
  final VoidCallback onLocaleToggle;

  const LocaleAppScreen({super.key, required this.onLocaleToggle});

  @override
  State<LocaleAppScreen> createState() => _LocaleAppScreenState();
}

class _LocaleAppScreenState extends State<LocaleAppScreen> {
  DateTime? _currentDateTime;

  int _counter = 0;
  final _nameController = TextEditingController();
  String? _greeting;
  String _selectedPizzaSize = 'medium';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _updateDateTime() {
    setState(() {
      _currentDateTime = DateTime.now();
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
              Text(
                _currentDateTime == null
                    ? 'Date not selected'
                    : localizations.dateFormat1(_currentDateTime!),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 16),
              Text(
                _currentDateTime == null
                    ? 'Date not selected'
                    : localizations.dateFormat2(_currentDateTime!),
                style: TextStyle(fontSize: 20),
              ),
              Text(
                _currentDateTime == null
                    ? 'Date not selected'
                    : localizations.dateTimeFormat(_currentDateTime!),
                style: const TextStyle(fontSize: 20),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _updateDateTime,
                child: Text(localizations.updateDateTime),
              ),
              SizedBox(height: 10),
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
              SizedBox(height: 24),
              Text(
                localizations.pizzaSizeLabel,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              DropdownButton<String>(
                value: _selectedPizzaSize,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedPizzaSize = newValue;
                    });
                  }
                },
                items: <String>['mini', 'small', 'medium', 'large', 'supersize']
                    .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(localizations.pizzaSize(value)),
                      );
                    })
                    .toList(),
              ),
              SizedBox(height: 16),
              Text(
                localizations.selectedSize(
                  localizations.pizzaSize(_selectedPizzaSize),
                ),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
