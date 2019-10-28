import 'package:flutter/material.dart';
import 'package:telas/pages/widgets/expansion_info.dart';
import 'package:telas/utils/constants.dart';


class DetailDescription extends StatelessWidget {
  final dynamic planta;

  DetailDescription(this.planta);

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 1,
      child: Container(
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Column(
          
          children: <Widget>[
            //SizedBox(height: 10),
            ExpansionInfo(
              title: "Informações",
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Linha 1zsdadsadsdsadsadsadsadsadsadsa"),                  
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Linha 2zsdadsadsdsadsadsadsadsadsadsa"),                  
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Linha 3zsdadsadsdsadsadsadsadsadsadsa"),                  
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Linha 4zsdadsadsdsadsadsadsadsadsadsa"),                  
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Linha 5zsdadsadsdsadsadsadsadsadsadsa"),                  
                  ],
                ),
              ],
              expand: true
            ),
            
            ExpansionInfo(
              title: "Informações",
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Linha 1zsdadsadsdsadsadsadsadsadsadsa"),                  
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Linha 2zsdadsadsdsadsadsadsadsadsadsa"),                  
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Linha 3zsdadsadsdsadsadsadsadsadsadsa"),                  
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Linha 4zsdadsadsdsadsadsadsadsadsadsa"),                  
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Linha 5zsdadsadsdsadsadsadsadsadsadsa"),                  
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Linha 5zsdadsadsdsadsadsadsadsadsadsa"),                  
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Linha 5zsdadsadsdsadsadsadsadsadsadsa"),                  
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Linha 5zsdadsadsdsadsadsadsadsadsadsa"),                  
                  ],
                ),
              ],
              expand: true
            ),
            
          ],
        ),
      ),
    );
  }
}
