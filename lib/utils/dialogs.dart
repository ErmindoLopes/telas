// ref https://github.com/RobertBrunhage/Youtube-Tutorials/blob/master/reusable_dialog_example/lib/dialogs.dart
// ref https://www.youtube.com/watch?v=1ukyE1KZ8Q4

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:telas/pages/widgets/custom_progress_indicator.dart';
import 'package:telas/utils/constants.dart';




enum DialogAction { yes, abort }

class Dialogs {
  
  static Future<DialogAction> yesAbortDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {

        return AlertDialog(          
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(DialogAction.abort),
              child: const Text('Não'),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pop(DialogAction.yes),
              color: kSecondaryLightColor,
              child: const Text(
                'Sim',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
    return (action != null) ? action : DialogAction.abort;
  }


  static Future<DialogAction> customYesAbortDialog(
    BuildContext context,
    Widget title,
    Widget body,
    {List<Widget> actions,
    Color bgColor}
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {

        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          title: title,
          content: body,
          actions: actions,
          backgroundColor: bgColor,
        );
      },
    );
    return (action != null) ? action : DialogAction.abort;
  }

  static waiting (BuildContext context, String title, String description){

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(            
            child: ListBody(
              
              children: <Widget>[
                Text(description),
                Center(child: new CustomProgressIndicator(), ),
                
              ],
            ),
          ),
        );
      }

    );


  }


  static popup (BuildContext context,  Widget content ){

    if (context ==  null)
      return null;


    return showDialog(

      context: context,
      barrierDismissible: false,

      child: Card(
        margin: EdgeInsets.symmetric(vertical: 25, horizontal: 15),        
        elevation: 1,
        child: Column(
          children: <Widget>[
            
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SingleChildScrollView(
                      child: content,
                    ),
                  ]
                ),
              ),
            ),
            
            ButtonTheme.bar(               
              child: ButtonBar( 
                alignment: MainAxisAlignment.end,                 
                children: <Widget>[
                  
                  MaterialButton(
                    color: kSecondaryLightColor,
                    splashColor: Colors.amberAccent,
                    child: Text(
                      'Fechar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(DialogAction.yes),
                  )
                ],
              ),
            ),

          ],
        ),
      ),

    );


  }

  

}