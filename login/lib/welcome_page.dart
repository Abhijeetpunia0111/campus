import 'package:flutter/material.dart';
import 'package:login/login_screen.dart';
import 'package:login/signup_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulating loading for 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

// animation code on starting of the app

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         color: Colors.orange[50],
        child: Center(
         
          child: AnimatedOpacity(
            
            opacity: isLoading ? 1.0 : 0.0,
            duration: Duration(milliseconds: 300),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitDoubleBounce(
                  color: Colors.orange[300],
                  size: 200.0,
                  // backgroundColor: Colors.orange[50],
                ),
                SizedBox(height: 16.0),
                Text(
                  'taking you \nto Campus',
                  style: TextStyle(fontSize: 60.0,fontFamily: 'Poppins',fontWeight: FontWeight.w700,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// after animation is over 
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
       backgroundColor: Colors.orange[50],
      body: Column(
         mainAxisAlignment: MainAxisAlignment.start,
        children: [
         Container(
        
        child: Image(
          image: AssetImage('assets/group.png'),
          fit: BoxFit.contain,
          height:400,
        ),
      ),
        Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "Cam",
                  style: TextStyle(
                    fontSize: 80.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
              Container(
                child: Text(
                  "pus",
                  style: TextStyle(
                    fontSize: 80.0,
                    fontWeight: FontWeight.w100,
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
            ],
          ),
    Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Padding(
     padding: EdgeInsets.fromLTRB(
    16.0, // left
    100.0, // top
    16.0, // right
    10.0, // bottom
  ),
      child: SizedBox(
        width: 400,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
          ),
          child: Text('Login', style: TextStyle(fontSize: 18.0,fontFamily: 'Poppins',fontWeight: FontWeight.w500,),),
        ),
      ),
    ),
    Padding(
      padding: EdgeInsets.all(16.0),
      child: SizedBox(
        width: 400,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/signup');
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
             
            ),
             backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
          ),
          child: Text('Sign Up', style: TextStyle(fontSize: 18.0,fontFamily: 'Poppins',fontWeight: FontWeight.w500,),),
        ),
      ),
    ),
  ],
),
Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  Padding(
     padding: EdgeInsets.fromLTRB(
    1.0, // left
    7.0, // top
    0.0, // right
    1.0, // bottom
  ),
  
        
        child: Image(
          image: AssetImage('images/coion.png'),
          fit: BoxFit.contain,
          
        ),



),
Padding(
     padding: EdgeInsets.fromLTRB(
    0.0, // left
   9.0, // top
   0.0, // right
    0.0, // bottom
  ),
  
        
        child: Image(
          image: AssetImage('images/coin.png'),
          fit: BoxFit.contain,
          height:178.0,
        ),



),
],
)
              




        ],
      ),
    );
  }
}
     


//  onPressed: () { Navigator.pushNamed(context, '/signup');},
//      child: Text('Sign Up'),