import 'package:flutter/material.dart';
import 'MyTheme.dart';
class DialogUtils{
  static void showLoading(BuildContext context,String Message)
  {
    showDialog(
        context: context, builder: (context){
      return AlertDialog(
        backgroundColor: MyTheme.PrimaryLight,
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 4,),
            Text(Message,style:TextStyle(color:Colors.black))
          ],
        ),
      );
    }
    );
  }
  static void closeLoading(BuildContext context)
  {
    Navigator.pop(context);
  }
  static void showMessage(BuildContext context,
      { String ?message,
        String? posActionName,
        VoidCallback ?posAction,
        String?title})
  {
    List<Widget> actions=[];
    showDialog(context: context,
        builder:(context){
          if(posActionName!.isNotEmpty)
          {
            actions.add(TextButton(onPressed: (){
              Navigator.pop(context);
              posAction?.call();
            }, child:Text(posActionName,style: TextStyle(color:Colors.black))
            ));
          }
          return AlertDialog(backgroundColor: MyTheme.PrimaryLight,
            title: Text(title!,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black),),
            content:Text(message!,style: Theme.of(context).textTheme.titleMedium?.copyWith(color:Colors.black)),
            actions: actions,
          );
        }
    );
  }
}