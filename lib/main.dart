
import 'package:flutter/material.dart';
import 'userdetail.dart';
import 'patient_detail.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Patents Managment',
      home: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => const HomeScreen(),
          );
        },
      ),
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('Asset/22.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            child: Stack(
              children: [
                Positioned(
                  left: 20,
                  top: 28,
                  child: Icon(
                    Icons.health_and_safety,
                    size: 24,
                    color: Colors.redAccent,
                  ),
                ),
                Positioned(
                  left: 45,
                  top: 28,
                  child: Text(
                    'Dedicated to Life',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      color: Colors.pink,
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 60,
                  child: Text(
                    'Patient Care',
                    style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ),
                Positioned(
                  left: 290,
                  top: 15,
                  child: CircleAvatar(
                    radius: 38,
                    backgroundImage: AssetImage('Asset/DO1.png'),
                  ),
                ),
                Positioned(
                  right: 30,
                  bottom: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserDetailScreen(),
                            ),
                          );
                        },
                        icon: Icon(Icons.add),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(items: const[
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',),
        BottomNavigationBarItem(icon: Icon(Icons.health_and_safety),label: 'Health',),
        BottomNavigationBarItem(icon: Icon(Icons.woman_2),label: 'Patient',),
      ],
        onTap: (int index) {
          if (index == 0) {

          } else if (index == 1) {

          } else if (index == 2) {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PatientDetailScreen()),
            );
          }
        },
        selectedItemColor: Colors.deepOrangeAccent,
      ),
    );
  }
}



