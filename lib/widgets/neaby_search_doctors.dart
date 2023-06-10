import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../Doctor/doctor_model.dart';

class NearbyDoctorsPage extends StatefulWidget {
  const NearbyDoctorsPage({Key? key}) : super(key: key);

  @override
  _NearbyDoctorsPageState createState() => _NearbyDoctorsPageState();
}

class _NearbyDoctorsPageState extends State<NearbyDoctorsPage> {
  List<DoctorModel> filteredDoctors = nearbyDoctors;
  TextEditingController searchController = TextEditingController();

  void filterDoctors(String searchText) {
    if (searchText.isEmpty) {
      setState(() {
        filteredDoctors = nearbyDoctors;
      });
    } else {
      setState(() {
        filteredDoctors = nearbyDoctors
            .where((doctor) =>
            doctor.name.toLowerCase().contains(searchText.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            controller: searchController,
            onChanged: filterDoctors,
            decoration: InputDecoration(
              hintText: 'Search doctors...',
              prefixIcon: Icon(Ionicons.search_outline),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: filteredDoctors.length,
            itemBuilder: (context, index) {
              final doctor = filteredDoctors[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(doctor.profile),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dr. ${doctor.name}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Text("General practitioner"),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(
                              Ionicons.star,
                              color: Colors.yellow[700],
                              size: 18,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 4, right: 6),
                              child: Text(
                                "4.0",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Text("195 Reviews")
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
