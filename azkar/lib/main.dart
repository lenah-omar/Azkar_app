import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  bool isDarkMode = false;
  int counter = sharedPreferences.getInt('my key') ?? 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Azkar App',
      theme: ThemeData.light(),
      darkTheme:ThemeData.dark(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: Text(' أذكار هاش _ بلس',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          textAlign: TextAlign.center,
          ),
          backgroundColor: const Color.fromARGB(255, 192, 118, 169),
          centerTitle: true,
        iconTheme: IconThemeData(
            color: Colors.white,
          ),
          actions: [
            IconButton(
              icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                setState(() {
                  isDarkMode = !isDarkMode;
                });
              },
            ),
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                 Text(" اٍّسًّتُّغٌّفّْرًّ اٍّلَّلَّهّْ اٍّلَّعَّظُيٌّمُّ وّ أتُّوّبّ إلَّيٌّهّْ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 40,),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(255, 192, 118, 169),
                ),
                child: Center(
                  child: Text('$counter',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ),
            SizedBox(height: 50,),
            ElevatedButton(
                onPressed: () async{
                  counter++;
                  await sharedPreferences.setInt('my key', counter);
                  setState(() {
                    
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 192, 118, 169),
                ),
                child: Text('استغفر',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () async {
                  counter = 0;
                  await sharedPreferences.setInt('my key', counter);
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: const Color.fromARGB(255, 192, 118, 169)),
                ),
                child: Text('إعادة',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}