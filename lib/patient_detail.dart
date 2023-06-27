

import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.teal,
    ),
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PatientDetailScreen()),
            );
          },
          child: const Text('View Patient Details'),
        ),
      ),
    );
  }
}

class PatientDetailScreen extends StatefulWidget {
  const PatientDetailScreen({Key? key}) : super(key: key);

  @override
  State<PatientDetailScreen> createState() => _PatientDetailScreenState();
}

class _PatientDetailScreenState extends State<PatientDetailScreen> {
  int _currentIndex = 2;
  final _database = FirebaseDatabase.instance;
  final ref = FirebaseDatabase.instance.ref('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Detail'),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              defaultChild: Center(child: CircularProgressIndicator()),
              itemBuilder: (context, snapshot, animation, index) {
                final key = snapshot.key.toString();
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        String patientName = snapshot.child('patientName').value.toString();
                        String age = snapshot.child('age').value.toString();
                        String gender = snapshot.child('gender').value.toString();
                        String mobileNumber = snapshot.child('mobileNumber').value.toString();
                        String medicine = snapshot.child('medicine').value.toString();
                        String patientProblem = snapshot.child('patientProblem').value.toString();
                        String totalBill = snapshot.child('totalBill').value.toString();

                        TextEditingController nameController = TextEditingController(text: patientName);
                        TextEditingController ageController = TextEditingController(text: age);
                        TextEditingController genderController = TextEditingController(text: gender);
                        TextEditingController mobileController = TextEditingController(text: mobileNumber);
                        TextEditingController medicineController = TextEditingController(text: medicine);
                        TextEditingController problemController = TextEditingController(text: patientProblem);
                        TextEditingController billController = TextEditingController(text: totalBill);

                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              title: const Text('Patient Detail'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildTextField('Name', nameController),
                                    _buildTextField('Age', ageController),
                                    _buildTextField('Gender', genderController),
                                    _buildTextField('Mobile Number', mobileController),
                                    _buildTextField('Medicine', medicineController),
                                    _buildTextField('Problem', problemController),
                                    _buildTextField('Total Bill', billController),
                                  ],
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    ref.child(key).update({
                                      'patientName': nameController.text,
                                      'age': ageController.text,
                                      'gender': genderController.text,
                                      'mobileNumber': mobileController.text,
                                      'medicine': medicineController.text,
                                      'patientProblem': problemController.text,
                                      'totalBill': billController.text,
                                    });
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(primary: Colors.green),
                                  child: const Text('Save'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    ref.child(key).remove();
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(primary: Colors.red),
                                  child: const Text('Delete'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Card(
                    color: Colors.white60,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.child('patientName').value.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.teal,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Age: ${snapshot.child('age').value.toString()}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          if (index == 0) {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          } else if (index == 1) {

          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PatientDetailScreen()),
            );
          }
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety),
            label: 'Health',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.woman), label: 'Patient'),
        ],
        selectedItemColor: Colors.deepOrangeAccent,
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: controller,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.lightGreen,
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 20,
            thickness: 0.4,
          ),
        ],
      ),
    );
  }
}


