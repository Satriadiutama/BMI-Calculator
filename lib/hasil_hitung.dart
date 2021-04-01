import 'package:flutter/material.dart'; 
import 'dart:math';
// ignore: unused_import
import 'about.dart';

class  BMIResult  extends  StatelessWidget  {


// ignore: non_constant_identifier_names
BMIResult({@required  this.tinggi_badan,  @required  this.berat_badan, 
// ignore: non_constant_identifier_names
@required  this.nama_lengkap,  @required  this.tahun_lahir,  @required  this.jk});
// ignore: non_constant_identifier_names
final  int  tinggi_badan; 
// ignore: non_constant_identifier_names
final  int  tahun_lahir; 
// ignore: non_constant_identifier_names
final  int  berat_badan; 
// ignore: non_constant_identifier_names
final  String  nama_lengkap; 
final String jk;



@override
Widget build(BuildContext context) {
    double  bmi  =  berat_badan/pow(tinggi_badan/100,2); 
    String  cBMI;
    if  (bmi>=28)  cBMI="Obesitas";  
    else  if  (bmi>=23)  cBMI="Gemuk"; 
    else  if  (bmi>=17.5)  cBMI="Normal"; 
    else  cBMI="Kurus";


    return Scaffold( 
      appBar:  AppBar(
        centerTitle:  true,  
        title:  Text('Hasil Dari Body Mass Index Anda Adalah'),
      ),
      body: Container( 
        color:  Colors.white,
        alignment:  Alignment.center, 
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.start, 
          crossAxisAlignment:  CrossAxisAlignment.center, 
          children:  <Widget>[
            SizedBox(height:  20,child:  Container( 
              color:  Colors.white,
            ),),
            new Text(
              // ignore: unnecessary_brace_in_string_interps
              "Nama  :  ${nama_lengkap}",
              style:  TextStyle(
                  fontSize:  20,
                  fontWeight:  FontWeight.w300, 
                  color: Colors.black87
              ),
            ),
            SizedBox(height:  10,child:  Container( 
              color:  Colors.white,
            ),),
 
            new Text(
              "Umur  :  ${2021  -  tahun_lahir}  Tahun",
              style:  TextStyle(
                  fontSize:  20,
                  fontWeight:  FontWeight.w300, 
                  color: Colors.black87
              ),
            ),
            SizedBox(height:  10,child:  Container( 
              color:  Colors.white,
            ),),
            
            new Text(
              // ignore: unnecessary_brace_in_string_interps
              "Jenis  Kelamin  :  ${jk}  ", 
              style:  TextStyle(
                  fontSize:  20,
                  fontWeight:  FontWeight.w300, 
                  color: Colors.black87
              ),
            ),
            SizedBox(height:  20,child:  Container( 
              color:  Colors.white,
            ),),
            Text(
              cBMI,
              style:  TextStyle( 
                  fontSize:  40,
                  fontWeight:  FontWeight.w500, 
                  color: Colors.brown,
              ),
            ),
            Text(
              bmi.toStringAsFixed(2), 
              style:  TextStyle(
                  fontSize:  100,
                  fontWeight:  FontWeight.w800, 
                  color: Colors.black,
              ),
            ),
            Text(
              'Jangkauan  Normal  BMI', 
              style:  TextStyle(
                  fontSize:  20,
                  fontWeight:  FontWeight.w800,
                  color:  Colors.black54,
              ),
            ),
            Text(
              '17,5-22.9',
              style:  TextStyle( 
                  fontSize:  20,
                  fontWeight:  FontWeight.w800, 
                  color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
