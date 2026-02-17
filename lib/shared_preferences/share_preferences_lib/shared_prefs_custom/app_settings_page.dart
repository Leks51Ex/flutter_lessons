import 'package:flutter/material.dart';
import 'package:flutter_stepik/shared_preferences/shared_prefs_custom/app_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsPage extends StatefulWidget {
  const AppSettingsPage({super.key, required this.preferences});

  final SharedPreferences preferences;

  @override
  State<AppSettingsPage> createState() => _AppSettingsPageState();
}

class _AppSettingsPageState extends State<AppSettingsPage> {
  late TextEditingController _languageController;
  late TextEditingController _fontSizeController;
  var _isDarkMode = false;
  
  @override
  void initState() {
  
  
      super.initState();
      final settings = loadAppSettings();
      _languageController = TextEditingController(
        text: settings.language,
      );

       _fontSizeController = TextEditingController(
      text: settings.fontSize.toString(),
    );
    _isDarkMode = settings.isDarkMode;
  }

    @override
  void dispose() {
    _languageController.dispose();
    _fontSizeController.dispose();
    super.dispose();
  }


  AppSettings loadAppSettings(){
    final json = widget.preferences.getString('app_settings');
    if (json == null) {
      return const AppSettings(
                     language: 'ru', fontSize: 18, isDarkMode: false);
    }
     return AppSettings.fromJson(json);
  }

    Future<void> saveAppSettings(AppSettings settings) async {
    final json = settings.toJson();
    await widget.preferences.setString('app_settings', json);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(16),
      child: Form(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         TextFormField(
                controller: _languageController,
                decoration: const InputDecoration(labelText: 'Язык'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _fontSizeController,
                decoration: const InputDecoration(
                                          labelText: 'Размер шрифта',
                                  ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
               SwitchListTile(
                title: const Text('Тёмная тема'),
                value: _isDarkMode,
                onChanged: (value) => setState(()=> _isDarkMode = value),
              ),
                       const Spacer(),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(onPressed: ()=>_onClearTap(context), child: Text('Сбросить')),
                              ElevatedButton(
                    onPressed: () => _onSaveTap(context),
                    child: const Text('Сохранить'),
                  ),
                        ],
                       )
        ],
      )),
      
      ),
    );
  }

   void _onSaveTap(BuildContext context) {
        final settings = AppSettings(
      language: _languageController.text,
      fontSize: double.parse(_fontSizeController.text),
      isDarkMode: _isDarkMode,
    );
    saveAppSettings(settings);
  }

  void _onClearTap(BuildContext context) {
      setState(() {
      widget.preferences.clear();
      _languageController.text = 'ru';
      _fontSizeController.text = '18';
      _isDarkMode = false;
    });
  }
}