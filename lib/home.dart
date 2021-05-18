import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_flutter/provider.dart';
class HomePage  extends StatelessWidget {
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CheckProvider>(
        create: (context)=>CheckProvider(),
    child: Builder(
      builder: (context){
        return Scaffold(
          appBar: AppBar(title: Text('Demo'),),
          body: Container(
            padding: EdgeInsets.all(16),
            child: Form(
              child: Consumer<CheckProvider>(
                builder: (context,provider,child){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: provider.isEligibility ? Colors.green:Colors.red,
                        ),
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(height: 10,),

                      TextFormField(
                        controller: ageController,
                        decoration: InputDecoration(
                          hintText: "Give Your Text",
                        ),
                        keyboardType: TextInputType.number,

                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: double.infinity,
                        child: FlatButton(
                          child: Text('Check'),
                          color: Colors.grey,
                          onPressed: (){

                         final int age=int.parse(ageController.text.trim());
                         provider.checkEligibility(age);
                            
                          },
                        ),
                      ),
                      SizedBox(height: 16,),
                      Text(provider.message)


                    ],
                  );
                },
              )


            ),
          ),

        );
      },
    ),
    );


  }
}
