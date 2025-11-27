
import 'package:flutter/material.dart';

class MenuBookOutLineScreen extends StatefulWidget {
  const MenuBookOutLineScreen({super.key});

  @override
  State<MenuBookOutLineScreen> createState() => _MenuBookOutLineScreenState();
}

class _MenuBookOutLineScreenState extends State<MenuBookOutLineScreen> {
  String currentGrade = "Primary 5";
  String hearAboutUs = "Friends";

  bool showGradeList = false;
  bool showHearList = false;

  final List<String> gradeList = [
    "Primary 1",
    "Primary 2",
    "Primary 3",
    "Primary 4",
    "Primary 5",
  ];

  final List<String> hearList = [
    "Instagram",
    "Medium",
    "Threads",
    "Friends",
    "School",
    "Teacher",
    "Others",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              const SizedBox(height: 20),

              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),

                    const Text(
                      "Personalizing course\naccording to your profile",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                      ),
                    ),

                    const SizedBox(height: 25),

                    _buildTitle("Current School"),
                    _buildInputBox("Diocesan Boys' School"),

                    const SizedBox(height: 18),

                    _buildTitle("Elective Subject"),
                    _buildInputBox("Diocesan Boys' School"),

                    const SizedBox(height: 18),

                    _buildTitle("Current Grade"),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showGradeList = !showGradeList;
                        });
                      },
                      child: _buildInputBox(currentGrade, isDropdown: true),
                    ),

                    _buildGradeDropdown(),

                    const SizedBox(height: 18),

                    _buildTitle("How Did You Hear About Us ?"),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showHearList = !showHearList;
                        });
                      },
                      child: _buildInputBox(hearAboutUs, isDropdown: true),
                    ),

                    _buildHearDropDown(),
                    const SizedBox(height: 220),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildInputBox(String text, {bool isDropdown = false}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: const TextStyle(fontSize: 16)),
          if (isDropdown)
            const Icon(Icons.keyboard_arrow_down_rounded, size: 26),
        ],
      ),
    );
  }

  Widget _buildGradeDropdown() {
    if (!showGradeList) return const SizedBox();

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: gradeList.map((item) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentGrade = item;
                    showGradeList = false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              if (item != gradeList.last)
                Container(
                  height: 1,
                  color: Colors.grey.shade300,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                )
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildHearDropDown() {
    if (!showHearList) return const SizedBox();

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: hearList.map((item) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    hearAboutUs = item;
                    showHearList = false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              if (item != hearList.last)
                Container(
                  height: 1,
                  color: Colors.grey.shade300,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                )
            ],
          );
        }).toList(),
      ),
    );
  }
}
