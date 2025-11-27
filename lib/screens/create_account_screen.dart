import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_project/screens/log_in_screen.dart';
import 'package:task_project/widgets/coustom_field.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController nameTEController = TextEditingController();
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final TextEditingController confirmPasswordTEController =
      TextEditingController();
  late TabController _tabController;
  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 223,
              width: 430,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xFF023F86),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: Expanded(
                      child: Image.asset(
                        "assets/images/Learnova-logo.png",
                        height: 70,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Learnova",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 37),
            const Text(
              "Create Account",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A2F5A),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 35,
              width: 222,
              padding: const EdgeInsets.all(4),
              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 1,
                indicatorPadding: const EdgeInsets.only(top: 15),
                tabs: const [
                  Tab(text: "Student"),
                  Tab(text: "Teacher"),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  customTextField(
                    controller: nameTEController,
                    label: "Name",
                    hint: "John Doe",
                  ),
                  const SizedBox(height: 8),
                  customTextField(
                    controller: emailTEController,
                    label: "Email",
                    hint: "John@gmail.com",
                  ),
                  const SizedBox(height: 8),
                  customTextField(
                    controller: passwordTEController,
                    label: "Password",
                    hint: "******",
                    obscureText: obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () => setState(() {
                        obscurePassword = !obscurePassword;
                      }),
                    ),
                  ),
                  const SizedBox(height: 8),
                  customTextField(
                    controller: confirmPasswordTEController,
                    label: " Confirm Password",
                    hint: "******",
                    obscureText: obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () => setState(() {
                        obscurePassword = !obscurePassword;
                      }),
                    ),
                  ),
                  const SizedBox(height: 46),
                  ElevatedButton(
                    onPressed: onTabNextScreen,
                    child: const Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            RichText(
              text: TextSpan(
                text: "Already Have an account? ",
                style: const TextStyle(color: Colors.black, fontSize: 16),
                children: [
                  TextSpan(
                    text: "Log in",
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTabNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LogInScreen()),
    );
  }

  @override
  void dispose() {
    nameTEController.dispose();
    emailTEController.dispose();
    passwordTEController.dispose();
    confirmPasswordTEController.dispose();
    _tabController.dispose();
    super.dispose();
  }
}
