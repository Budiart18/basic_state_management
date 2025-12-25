import 'package:flutter/material.dart';
import 'theme.dart';

void main() {
  runApp(const PaymentApps());
}

class PaymentApps extends StatefulWidget {
  const PaymentApps({super.key});

  @override
  State<PaymentApps> createState() => _PaymentAppsState();
}

class _PaymentAppsState extends State<PaymentApps> {
  @override
  Widget header() {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 32, right: 32),
      child: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/achive_goal.png',
              width: 270,
              height: 200,
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Upgrade to ', style: titleTextStyle),
              Text('Pro', style: titleProTextStyle),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Go unlock all features and \nbuild your own business bigger',
            style: subTitleTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  int selectedIndex = -1;

  Widget option(int index, String title, String subTitle, String price) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedIndex == index
                ? Color(0xFF007DFF)
                : Color(0xFF4D5B7C),
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            selectedIndex == index
                ? Image.asset('assets/checked.png', height: 18, width: 18)
                : Image.asset('assets/uncheck.png', height: 18, width: 18),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: optionTitleTextStyle,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 4),
                  Text(
                    subTitle,
                    style: optionDescTextStyle,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Text(price, style: optionPriceTextStyle),
          ],
        ),
      ),
    );
  }

  Widget checkoutButton() {
    return selectedIndex == -1
        ? SizedBox()
        : SizedBox(
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withAlpha(100),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: Color(0xFF007DFF),
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(vertical: 24),
                ),
                child: Text('Checkout Now', style: buttonTextStyle),
              ),
            ),
          );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF04112F),
        body: Column(
          children: [
            header(),
            SizedBox(height: 50),
            option(0, 'Monthly', 'Good for starting up', '\$20'),
            option(1, 'Quarterly', 'Focusing on building', '\$50'),
            option(2, 'Yearly', 'Steady company', '\$220'),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: checkoutButton(),
            ),
          ],
        ),
      ),
    );
  }
}
