import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/logbackg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                //Image.asset('assets/login.png', fit: BoxFit.cover),
                SizedBox(
                  height: 900,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Card number",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  //controller: cardNoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Expiry date",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  //controller: expController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'MM/YY',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "CVV",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  //controller: cvvController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        // Calculate and display the total
                        //totalCal();
                      },
                      child: Text('Total = '),
                      color: Colors.green,
                      textColor: Colors.white,
                      minWidth: 100,
                      height: 40,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        // Calculate the total
                        //t//otalCal();

                        // Get the card number entered by the user
                        /* final cardNum = cardNoController.text;
                        final exp = expController.text;
                        final cvv = cvvController.text;*/

                        // Get available balance
                        //var balance = await getAvailableBalance(cardNum,exp,cvv);

                        /*if (balance >= total) {
                          // Sufficient balance, proceed with the payment

                          post();
                          balance = balance - total;
                          updateBalance(cardNum,balance);
                          print('Payment successful');
                        } else {
                          // Insufficient balance
                          print('Insufficient balance');
                        }*/
                      },
                      child: Text('Pay'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      minWidth: 100,
                      height: 40,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
