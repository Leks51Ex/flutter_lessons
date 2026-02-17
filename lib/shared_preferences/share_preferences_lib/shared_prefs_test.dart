import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
/// -Что рекомендуется сохранять используя библиотеку SharedPreferences
/// -Настройки приложения;
///-Небольшой объем открытых данных, к которому нужен быстрый доступ (легкий кэш);
///-Выбранная тема (светлая/тёмная);
///-Предпочитаемый язык;
///-Включение/выключение уведомлений;
///-Настройки отображения (например, размер шрифта);
///-Флаги состояний (признаки);
///-Последняя открытая вкладка или экран;
///-Время последнего обновления данных из API;
///-Количество запусков приложения;
///-Последняя дата использования.
///
///
class SharedPrefsExample extends StatelessWidget {

 final SharedPreferences preferences;


  const SharedPrefsExample({super.key, required this.preferences});


      Future<void> saveAppSettings() async{
      await preferences.setString('selected_language', 'ru');

        // Устанавливаем размер шрифта – 18.0
      await preferences.setDouble('selected_font_size', 58.0);

    // Устанавливаем количество баннеров для показа – 3
      await preferences.setInt('showing_banners_count', 3);

    // Устанавливаем темную тему – true
      await preferences.setBool('is_dark_mode', true);

          final categories = ['sport', 'music', 'busines'];
  await preferences.setStringList(
                         'favorite_news_categories', categories,
    );

     }


     void loadAppSettings(){
          final language = preferences.getString('selected_language') ?? 'en';
    print(language);

        final fontSize = preferences.getDouble('selected_font_size') ?? 16;
    print(fontSize);

        final isDarkMode = preferences.getBool('is_dark_mode') ?? false;
    print(isDarkMode);

        final categories = preferences.getStringList('favorite_news_categories');
    print(categories ?? ['sport', 'music', 'busines']);
     }

     Future<void> saveAppStartTime()async{
      final nowTime = DateTime.now().toIso8601String();
      await preferences.setString('app_start_tome', nowTime);
     }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        children: [
          FloatingActionButton(onPressed: (){
            loadAppSettings();
          },
          child: Icon(Icons.remove_red_eye),
          ),
          SizedBox(height: 15,),
          FloatingActionButton(
              onPressed: (){
                saveAppSettings();
              }, 
              child: const Icon(Icons.save),
            ),
            Text('Hello', style: TextStyle(
              fontSize: preferences.getDouble('selected_font_size')
            ),)
        ],
      ),
    );
  }
}