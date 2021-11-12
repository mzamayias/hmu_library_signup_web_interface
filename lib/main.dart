import 'package:flutter/material.dart';
import 'package:hmu_library_signup_web_interface/src/widgets/main_button.dart';
import 'package:hmu_library_signup_web_interface/src/widgets/secondary_button.dart';

import 'src/misc/text_theme.dart';
import 'src/view/default_view/default_view.dart';

void main() {
  runApp(const HMULibrarySignUpWebInterface());
}

class HMULibrarySignUpWebInterface extends StatelessWidget {
  const HMULibrarySignUpWebInterface({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HMU Library',
      theme: ThemeData(
        textTheme: textTheme,
      ),
      home: Scaffold(
        body: DefaultView(
          headerChildren: [
            Row(
              children: const [
                MainButton(string: 'email',),
                SecondaryButton(string: 'Google',),
                SecondaryButton(string: 'Linkeln',),
              ],
            )
          ],
          contentChildren: [
            Row(
              children: const [
                MainButton(
                  string: 'Go Back',
                ),
                MainButton(
                  string: 'Continue',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
