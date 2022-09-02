import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'components/my_button.dart';
import 'constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreenSTF();
  }
}

class HomeScreenSTF extends StatefulWidget {
  const HomeScreenSTF({Key? key}) : super(key: key);

  @override
  State<HomeScreenSTF> createState() => _HomeScreenSTFState();
}

class _HomeScreenSTFState extends State<HomeScreenSTF> {
  var userInput ='';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child:Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Text(userInput.toString(),style: TextStyle(fontSize: 30,color: Colors.white),),
                        Text(answer.toString(),style: TextStyle(fontSize: 30,color: Colors.white),),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MYButton(title: 'AC',onPress: (){
                            userInput= '';
                            answer ='';
                            setState((){});
                          },),
                          MYButton(title: '+/-',onPress: (){
                            userInput =userInput+'+/-';
                            setState((){});
                          },),
                          MYButton(title: '%',onPress: (){
                            userInput =userInput+'%';
                            setState((){});
                          },),
                          MYButton(title: '/',color: Color(0xffffa00a),onPress: (){
                            userInput =userInput+'/';
                            setState((){});
                          },),




                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MYButton(title: '7',onPress: (){
                            userInput =userInput+'7';
                            setState((){});
                          }),
                          MYButton(title: '8',onPress: (){
                            userInput =userInput+'8';
                            setState((){});
                          },),
                          MYButton(title: '9',onPress: (){
                            userInput =userInput+'9';
                            setState((){});
                          },),
                          MYButton(title: 'x',color: Color(0xffffa00a),onPress: (){
                            userInput =userInput+'x';
                            setState((){});
                          },),




                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MYButton(title: '4',onPress: (){
                            userInput =userInput+'4';
                            setState((){});
                          },),
                          MYButton(title: '5',onPress: (){
                            userInput =userInput+'5';
                            setState((){});
                          },),
                          MYButton(title: '6',onPress: (){
                            userInput =userInput+'6';
                            setState((){});
                          },),
                          MYButton(title: '-',color: Color(0xffffa00a),onPress: (){
                            userInput =userInput+'-';
                            setState((){});
                          },),




                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MYButton(title: '1',onPress: (){
                            userInput =userInput+'1';
                            setState((){});
                          },),
                          MYButton(title: '2',onPress: (){
                            userInput =userInput+'2';
                            setState((){});
                          },),
                          MYButton(title: '3',onPress: (){
                            userInput =userInput+'3';
                            setState((){});
                          },),
                          MYButton(title: '+',color: Color(0xffffa00a),onPress: (){
                            userInput =userInput+'+';
                            setState((){});
                          },),




                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MYButton(title: '0',onPress: (){
                            userInput =userInput+'0';
                            setState((){});
                          },),
                          MYButton(title: '.',onPress: (){
                            userInput =userInput+'.';
                            setState((){});
                          },),
                          MYButton(title: 'DEL',onPress: (){
                            userInput= userInput.substring(0, userInput.length - 1);
                            setState((){

                            });
                          },),
                          MYButton(title: '=',color: Color(0xffffa00a),onPress: (){
                            equalPress();
                            setState((){});
                          },),




                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ) ),
    );
  }
  void equalPress(){
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');

    Parser p =Parser();
    Expression expression =p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL,contextModel);
    answer = eval.toString();
  }
}




