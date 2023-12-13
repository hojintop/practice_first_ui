import 'package:flutter/material.dart';
import 'package:practice_toonflix/widgets/button.dart';
import 'package:practice_toonflix/widgets/simil_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Kim Ho Jin',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'welcome back!',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 17,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Total Balance',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$5 194 482',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 41,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MtButton(
                      text: 'Transfer',
                      boxColor: Colors.amber,
                      fontColor: Colors.black,
                    ),
                    MtButton(
                      text: 'request',
                      boxColor: Colors.white,
                      fontColor: Colors.black,
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Wallets',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Simil_card(
                  sidType: 'Euro',
                  price: '5 429',
                  moneyType: 'EUR',
                  sidIcon: Icon(
                    Icons.euro_symbol_outlined,
                    size: 88,
                    color: Colors.white,
                  ),
                  bgColor:  Color(0xff1f2123),
                  fontColor: Colors.white,
                  cardOffsetY: 0,
                ),
                const Simil_card(
                  sidType: 'Dollar',
                  price: '55 722',
                  moneyType: 'USD',
                  sidIcon: Icon(
                    Icons.monetization_on_outlined,
                    size: 88,
                    color: Colors.black,
                  ),
                  bgColor:  Colors.white,
                  fontColor: Colors.black,
                  cardOffsetY: 3,
                ),
                const Simil_card(
                  sidType: 'Rupee',
                  price: '28 382',
                  moneyType: 'INR',
                  sidIcon: Icon(
                    Icons.currency_rupee_outlined,
                    size: 88,
                    color: Colors.white,
                  ),
                  bgColor:  Color(0xff1f2123),
                  fontColor: Colors.white,
                  cardOffsetY: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
