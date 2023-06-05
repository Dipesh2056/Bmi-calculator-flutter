import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

var wtController =TextEditingController();
var ftController = TextEditingController();
var inController = TextEditingController();

var result ="";
var bgColor  ;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(

            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI' ,style:TextStyle(fontSize: 34.0,
                fontWeight: FontWeight.w700) ,),

                SizedBox(height: 21.0,),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text("Enter your Weight in kg"),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,

                ),
                SizedBox(height: 21.0,),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text("Enter your height (in feet)"),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,

                ),

                SizedBox(height: 21.0,),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text("Enter your height (in inch)"),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,

                ),
                SizedBox(height: 16.0,),
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt!=""&& ft!=""&& inch!=""){
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (iFt*12)+iInch;
                    var tCm   = (tInch*2.54);
                    var tM    = tCm/100;
                    var bmi  =  iWt/(tM*tM);

                    var msg="";

                    if( bmi>25){
                      msg ="You're Overweight!";
                      bgColor  = Colors.orange.shade300;

                    }else if(bmi<18){
                      msg="You're UnderWeight!";
                      bgColor  = Colors.red.shade300;


                    } else{
                      msg = "You're Healthy!";
                      bgColor  = Colors.green.shade300;


                    }

                    setState(() {
                      result= "$msg \n Your BMI is :${bmi.toStringAsFixed(3)}";


                    });


                    //BMI calculation

                  }else{
                    setState(() {
                      result="Please fill all the require blanks";

                    });


                  }
                },
                    child: Text('Calculate')),
                SizedBox(height: 11.0,),
                Text(result,style: TextStyle(fontSize: 19.0),)
              ],

            ),
          ),
        ),
      )
    );
  }
}
