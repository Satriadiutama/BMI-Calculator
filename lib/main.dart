import 'package:flutter/material.dart'; 
import 'hasil_hitung.dart';
import 'about.dart';

void main(){
  runApp(new  MaterialApp( 
    home:  new  Home(),
    routes: <String, WidgetBuilder>{
      '/Halsatu'  :  (BuildContext  context)  =>  new  Home(),
      '/Haldua'  :  (BuildContext  context)  =>  new  MyProfil(),

    }, 
  ));
}

class  Home  extends  StatefulWidget  { 
  @override
  _HomeState  createState()  =>  new  _HomeState();
}

class _HomeState extends State<Home> { 
  
  int  tinggi  =  0;
  int  berat  =  0;
  int  tahun  =  0; 
  
  String  _jk="";

  void _pilihJk(String value){ 
    setState(() {
      _jk  =  value;
    });
  }

  var _nama = new TextEditingController();  
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold( 
      appBar: new AppBar(
        leading:  new  Icon(Icons.menu),
        title:  new  Text('Aplikasi Menghitung Body Mass Index'),
        centerTitle:  true,  
        backgroundColor:  Colors.brown[900],
        actions:  <Widget>[
          new  IconButton(
            icon:  Icon(Icons.account_circle),
            onPressed: (){
              Navigator.pushNamed(context,  '/Haldua');
            },
          )
        ],
      ),

      body:  ListView( 
        children:  <Widget>[
          new  Container(
            padding:  new  EdgeInsets.only(top: 40.0, left: 25.0, right: 25.0, bottom: 25.0),
            child:  new  Column(
              children:  <Widget>[
                new TextField( 
                  controller:  _nama,
                  decoration: new InputDecoration( 
                      hintText:  "Masukkan  Nama Lengkap Anda Disini  ",
                      labelText:  "Nama  Lengkap",
                      border:  new  OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(30.0)
                      )
                  ),
                ),

                new  Padding(padding:  new  EdgeInsets.only(top:  20.0)),


                new TextField( 
                  onChanged: (txt) {
                    setState(() {
                      tahun  =  int.parse(txt);
                    });
                  },

                  keyboardType:  TextInputType.number,
                  decoration: new InputDecoration( 
                      hintText:  "Masukkan  Tahun  Lahir Anda Disini",
                      labelText:  "Tahun Lahir",
                      border:  new  OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(30.0)
                      )
                  ),
                ),

                new  Padding(padding:  new  EdgeInsets.only(top:  20.0)),
                Text('Jenis Kelamin',
                  style: TextStyle(color: Colors.black,
                      fontSize: 17.0),
                ),
                new  RadioListTile(
                  activeColor: Colors.red[900],
                  value:  "Laki-laki", 
                  groupValue: _jk,
                  title:  new  Text("Laki-laki"), 
                  onChanged: (String value){
                    _pilihJk(value);
                  },
                  subtitle:  new  Text("Pilih  ini  jika  Anda  Laki-laki"),
                ),
                
                new  RadioListTile(
                  activeColor: Colors.red[900],
                  value:  "Perempuan", 
                  groupValue: _jk,
                  title:  new  Text("Perempuan"), 
                  onChanged: (String value){
                    _pilihJk(value);
                  },
                  subtitle:  new  Text("Pilih  ini  jika  Anda  Perempuan"),
                ),

                new  Padding(padding:  new  EdgeInsets.only(top:  25.0)),

                new  Row(
                  children: <Widget>[ 
                    Expanded(
                      child:  TextField( 
                        onChanged: (txt) {
                          setState(() {
                            tinggi  =  int.parse(txt);
                          });
                        },

                        keyboardType:  TextInputType.number,
                        textAlign:  TextAlign.center, 
                        style:  TextStyle(
                          fontSize:  16,
                        ),
                        decoration:  InputDecoration( 
                            labelText:  "Tinggi  Badan", 
                            suffix:  Text('cm'),
                            border:  new  OutlineInputBorder(
                                borderRadius:  new  BorderRadius.circular(30.0)
                            ),
                            //filled: true,
                            hintText:  'Tinggi'),
                      ),
                    ),
                    SizedBox( 
                      width:  15,
                    ),
                    Expanded(
                      child:  TextField(

                        onChanged: (txt) { 
                          setState(() {
                            berat  =  int.parse(txt);
                          });
                        },

                        keyboardType:  TextInputType.number,
                        textAlign:  TextAlign.center, 
                        style:  TextStyle(
                          fontSize:  16,
                        ),
                        decoration:  InputDecoration( 
                            labelText:  "Berat  Badan", 
                            suffix:  Text('kg'),
                            border:  new  OutlineInputBorder(
                                borderRadius:  new  BorderRadius.circular(30.0)
                            ),
                            //filled: true,
                            hintText:  'Berat'),

                      ),
                    ),
                  ],
                ),

                new  Padding(padding:  new  EdgeInsets.only(top:  20.0, bottom: 20.0)),
            RaisedButton(
              child: Text('Hitung',
                style: TextStyle(color: Colors.white,
                    fontSize: 19.0),
              ),
              color: Colors.red[900],
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 35.0),
              onPressed: () {
                var  route  =  new  MaterialPageRoute(
                  // ignore: non_constant_identifier_names
                  builder:  (BuildContext)  =>
                  new  BMIResult(nama_lengkap  :  _nama.text,tinggi_badan: tinggi,  berat_badan:  berat,  tahun_lahir:  tahun,  jk:  _jk),
                );
                Navigator.of(context).push(route);
                },
               ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
