import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Dashboard Pages/dashboard_admin.dart';
import '../Dashboard Pages/dashboard_general.dart';

class UserFormScreen extends StatefulWidget {
  @override
  _UserFormScreenState createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController provinceController = TextEditingController();
  TextEditingController homeAddressController = TextEditingController();
  TextEditingController nicController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  bool isDoctor = false;
  TextEditingController doctorNameController = TextEditingController();
  TextEditingController doctorDistrictController = TextEditingController();
  TextEditingController doctorProvinceController = TextEditingController();
  TextEditingController doctorHomeAddressController = TextEditingController();
  TextEditingController doctorSpecialTypeController = TextEditingController();
  TextEditingController doctorNicController = TextEditingController();
  TextEditingController doctorRegistrationNumberController =
  TextEditingController();
  TextEditingController doctorHospitalController = TextEditingController();
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  void saveDetails() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String? email = user?.email;

    if (email != null) {
      CollectionReference users =
      FirebaseFirestore.instance.collection('personal_details');
      await users.doc(email).set({
        'name': nameController.text,
        'age': ageController.text,
        'height': heightController.text,
        'weight': weightController.text,
        'district': districtController.text,
        'province': provinceController.text,
        'home_address': homeAddressController.text,
        'nic': nicController.text,
        'dob': dobController.text,
        'is_doctor': isDoctor,
        'doctor_name': doctorNameController.text,
        'doctor_district': doctorDistrictController.text,
        'doctor_province': doctorProvinceController.text,
        'doctor_home_address': doctorHomeAddressController.text,
        'doctor_special_type': doctorSpecialTypeController.text,
        'doctor_nic': doctorNicController.text,
        'doctor_registration_number':
        doctorRegistrationNumberController.text,
        'doctor_hospital': doctorHospitalController.text,
        'start_time': startTime?.format(context),
        'end_time': endTime?.format(context),
      });

      if (isDoctor) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardDoctorPage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardGenPage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'Are you a patient or a doctor?',
                style: TextStyle(fontSize: 16),
              ),
              Row(
                children: [
                  Radio(
                    value: false,
                    groupValue: isDoctor,
                    onChanged: (value) {
                      setState(() {
                        isDoctor = value!;
                      });
                    },
                  ),
                  Text('Patient'),
                  SizedBox(width: 16),
                  Radio(
                    value: true,
                    groupValue: isDoctor,
                    onChanged: (value) {
                      setState(() {
                        isDoctor = value!;
                      });
                    },
                  ),
                  Text('Doctor'),
                ],
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: heightController,
                decoration: InputDecoration(labelText: 'Height'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your height';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: weightController,
                decoration: InputDecoration(labelText: 'Weight'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your weight';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: districtController,
                decoration: InputDecoration(labelText: 'District'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your district';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: provinceController,
                decoration: InputDecoration(labelText: 'Province'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your province';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: homeAddressController,
                decoration: InputDecoration(labelText: 'Home Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your home address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: nicController,
                decoration: InputDecoration(labelText: 'NIC'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your NIC';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: dobController,
                decoration: InputDecoration(labelText: 'Date of Birth'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your date of birth';
                  }
                  return null;
                },
              ),
              if (isDoctor) ...[
                SizedBox(height: 16),
                TextFormField(
                  controller: doctorNameController,
                  decoration: InputDecoration(labelText: 'Doctor Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter doctor\'s name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: doctorDistrictController,
                  decoration: InputDecoration(labelText: 'Doctor District'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter doctor\'s district';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: doctorProvinceController,
                  decoration: InputDecoration(labelText: 'Doctor Province'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter doctor\'s province';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: doctorHomeAddressController,
                  decoration: InputDecoration(labelText: 'Doctor Home Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter doctor\'s home address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: doctorSpecialTypeController,
                  decoration: InputDecoration(labelText: 'Special Type'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter doctor\'s special type';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: doctorNicController,
                  decoration: InputDecoration(labelText: 'Doctor NIC'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter doctor\'s NIC';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: doctorRegistrationNumberController,
                  decoration:
                  InputDecoration(labelText: 'Doctor Registration Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter doctor\'s registration number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: doctorHospitalController,
                  decoration: InputDecoration(labelText: 'Doctor Hospital'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter doctor\'s hospital';
                    }
                    return null;
                  },
                ),
              ],
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    saveDetails();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Details saved successfully!'),
                      ),
                    );
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
