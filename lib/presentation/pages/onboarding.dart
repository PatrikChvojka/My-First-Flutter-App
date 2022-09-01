import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Wrapper extends StatelessWidget {
  final bool showHome;
  const Wrapper({Key? key, required this.showHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (showHome) {
      return Onboarding();
      // return MyApp();
    } else {
      return Onboarding();
    }
  }
}

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required title,
    required subtitle,
  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              urlImage,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(239, 189, 107, 1),
                fontSize: 32,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(208, 160, 81, 1)),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            if (index == 2) {
              setState(() {
                isLastPage = true;
              });
            } else {
              setState(() {
                isLastPage = false;
              });
            }
            print(isLastPage);
          },
          children: [
            buildPage(
              color: Color.fromRGBO(255, 238, 233, 1),
              urlImage: 'lib/assets/onboarding01.png',
              title: '''Nájdi svoju
reštauráciu''',
              subtitle:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has',
            ),
            buildPage(
              color: Color.fromRGBO(255, 238, 233, 1),
              urlImage: 'lib/assets/onboarding02.png',
              title: '''Vyber jedlo ktoré
 miluješ''',
              subtitle:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has',
            ),
            buildPage(
              color: Color.fromRGBO(255, 238, 233, 1),
              urlImage: 'lib/assets/onboarding03.png',
              title: '''Objednaj a my ti to
doručíme až domov''',
              subtitle:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has',
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color.fromRGBO(239, 189, 107, 1),
                  minimumSize: const Size.fromHeight(80)),
              child: const Text(
                'Poďme na to!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                ),
              ),
              onPressed: () async {
                // navigate rirectly to home page
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
            )
          : Container(
              color: Color.fromRGBO(255, 238, 233, 1),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              height: 80.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text('SKIP'),
                    style: TextButton.styleFrom(
                      primary: Color.fromRGBO(239, 189, 107, 1),
                    ),
                    onPressed: () => controller.jumpToPage(2),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.white,
                        activeDotColor: Color.fromRGBO(239, 189, 107, 1),
                      ),
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ),
                  TextButton(
                    child: const Text('NEXT'),
                    style: TextButton.styleFrom(
                      primary: Color.fromRGBO(239, 189, 107, 1),
                    ),
                    onPressed: () => controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
