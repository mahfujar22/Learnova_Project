import 'package:flutter/material.dart';
import 'package:task_project/screens/main_button_nav_screen.dart';

class LightBulbOutlineScreen extends StatefulWidget {
  const LightBulbOutlineScreen({super.key});

  @override
  State<LightBulbOutlineScreen> createState() => _LightBulbOutlineScreenState();
}

class _LightBulbOutlineScreenState extends State<LightBulbOutlineScreen>
    with SingleTickerProviderStateMixin {
  int selectedIndex = -1;

  bool showExplanation = false;

  late AnimationController controller;
  late Animation<Offset> slideUp;

  List<String> options = ["Scared", "Frightening", "Timid", "Concerned"];

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );

    slideUp = Tween(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _showExplanation() {
    setState(() => showExplanation = true);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  "Let’s Test Your Understanding!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE7F2FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Vocabulary",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF007BFF),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    Row(
                      children: const [
                        Icon(Icons.watch_later_outlined, size: 20),
                        SizedBox(width: 4),
                        Text(
                          "23.03s",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F6FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "Q. My dog is a little __ , especially when around other dogs.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Column(
                  children: List.generate(options.length, (index) {
                    bool selected = selectedIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });

                        if (index == 2) {
                          _showExplanation();
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                          border: Border.all(
                            color: selected
                                ? Colors.blue
                                : Colors.grey.shade300,
                            width: selected ? 1.7 : 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              options[index],
                              style: TextStyle(
                                fontSize: 16,
                                color: selected
                                    ? Colors.black
                                    : Colors.grey.shade700,
                                fontWeight: selected
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                              ),
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: selected
                                  ? Colors.blue
                                  : Colors.grey.shade200,
                              child: Text(
                                String.fromCharCode(65 + index),
                                style: TextStyle(
                                  color: selected
                                      ? Colors.white
                                      : Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Next',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),

                const SizedBox(height: 200),
              ],
            ),
          ),

          if (showExplanation)
            SlideTransition(
              position: slideUp,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 55),

                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white70,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MainBottomNavScreen(),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.arrow_back),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Back",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 22),

                            const Text(
                              "Well Done! Here Is The Explanation",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            const SizedBox(height: 15),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE7F2FF),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    "Vocabulary",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF007BFF),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),

                                Row(
                                  children: const [
                                    Icon(Icons.watch_later_outlined, size: 20),
                                    SizedBox(width: 4),
                                    Text(
                                      "23.03s",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                color: Color(0xFFF0F6FF),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                "Q. My dog is a little __ , especially when around other dogs.",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 1.4,
                                ),
                              ),
                            ),

                            const SizedBox(height: 15),

                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 390,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: const Color(0xFFDBF1FF),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 15,
                                        left: 8,
                                      ),
                                      child: Text(
                                        "Timid (膽小)",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Explanation\n\nTimid 的意思是容易感到害怕，容易受到驚嚇，這通常在面對陌生的狗時顯得更明顯。",
                                    style: TextStyle(height: 1.5),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    "• Scary (可怕) 和 Frightening (嚇人) 表示對他產生超越正常的恐懼感，這與狗對其他狗的反應不符。",
                                    style: TextStyle(height: 1.5),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "• Concerned (擔憂) 通常不用來描述狗與其他狗接觸時感到緊張的反應。",
                                    style: TextStyle(height: 1.5),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
