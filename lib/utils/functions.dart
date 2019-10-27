
import 'package:flutter/material.dart';

List<Widget> injectAdmob(List<Widget> lista, {bool inject = true}){
  
  if (lista == null)
    return null;

  if (!inject)
    return lista;

  
  var tamanho = lista.length;
  var listaFinal = <Widget>[];

  if (tamanho <= 3){
    listaFinal.addAll(lista);
    listaFinal.add(Container(color:Colors.red, height: 10, width: double.infinity,));
  }
  else{
    var x = (tamanho / 3.0).ceil();
    var mod = (tamanho % 3.0);

    
    for(int i=0; i<=x-1; i++){

      if(i < x-1){
        listaFinal.addAll(lista.sublist( (i*3), (i*3)+3));
        listaFinal.add(Container(color:Colors.red, height: 10, width: double.infinity,));
      }
      else{
        listaFinal.addAll(lista.sublist( (i*3), lista.length ));

        if (mod == 0)
          listaFinal.add(Container(color:Colors.red, height: 10, width: double.infinity,));
      }

      

    }
  }    
  
  return listaFinal;
    
}