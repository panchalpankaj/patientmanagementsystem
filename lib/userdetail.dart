




import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:patentmanagment/patient_detail.dart';
class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {

  int _currentIndex = 2;
  final _formKey = GlobalKey<FormState>();

  String patientName = '';
  int age = 0;
  String gender = '';
  String mobileNumber = '';
  String medicine = '';
  String patientProblem = '';
  double totalBill = 0.0;

  late DatabaseReference databaseRef;


  @override
  void initState() {
    super.initState();
    databaseRef = FirebaseDatabase.instance.reference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fill The Patient Details'),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Patient Name',
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.teal,
                      fontSize: 16.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.teal,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the patient name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      patientName = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Age',
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.teal,
                      fontSize: 16.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.cyan,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.teal,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the age';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      age = int.tryParse(value) ?? 0;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.teal,
                      fontSize: 16.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.teal,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the gender';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.teal,
                      fontSize: 16.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.teal,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the mobile number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      mobileNumber = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Medicine',
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.teal,
                      fontSize: 16.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.cyan,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.teal,
                  ),
                  onChanged: (value) {
                    setState(() {
                      medicine = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Patient Problem',
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.teal,
                      fontSize: 16.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.teal,
                  ),
                  onChanged: (value) {
                    setState(() {
                      patientProblem = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Total Bill',
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.teal,
                      fontSize: 16.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.teal,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the total bill';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      totalBill = double.tryParse(value) ?? 0.0;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      saveUserData();

                    }
                  },
                  child: const Text('Save'),

                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(

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
          }
          );
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.health_and_safety), label: 'Health'),
          BottomNavigationBarItem(icon: Icon(Icons.woman_2), label: 'Patient'),
        ],
        selectedItemColor: Colors.deepOrangeAccent,
      ),
    );
  }

  void saveUserData() {
    DatabaseReference userRef = databaseRef.child('users');
    DatabaseReference newUserRef = userRef.push();
    newUserRef.set({
      'patientName': patientName,
      'age': age,
      'gender': gender,
      'mobileNumber': mobileNumber,
      'medicine': medicine,
      'patientProblem': patientProblem,
      'totalBill': totalBill,
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('User data saved successfully!'),
      ));
      resetFields();
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Failed to save user data.'),
      ));
    });
  }

  void resetFields() {
    setState(() {
      patientName = '';
      age = 0;
      gender = '';
      mobileNumber = '';
      medicine = '';
      patientProblem = '';
      totalBill = 0.0;
    });
  }
}



