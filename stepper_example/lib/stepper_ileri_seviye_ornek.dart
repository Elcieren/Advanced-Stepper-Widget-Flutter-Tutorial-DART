import 'package:flutter/material.dart';

class StepperOrnek extends StatefulWidget {
  const StepperOrnek({super.key});

  @override
  State<StepperOrnek> createState() => _StepperOrnekState();
}

class _StepperOrnekState extends State<StepperOrnek> {
  int _aktifStep=0;
  String isim='',mail='',sifre='';
  List<Step> tumStepler=[];
  var key0=GlobalKey<FormFieldState>();
  var key1=GlobalKey<FormFieldState>();
  var key2=GlobalKey<FormFieldState>();
  bool hata=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    tumStepler=_tumStepler();
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper Örnek'),
        ),
        body: SingleChildScrollView(
          child: Stepper(
            steps: tumStepler,
            currentStep: _aktifStep,
            /* onStepTapped: (tiklananstep){
              setState(() {
                _aktifStep=tiklananstep;
              });
            } */
            onStepContinue: (){
                 setState(() {
                   {
                    _ileriButonuKontrolu();
                 }
                 });
            },
            onStepCancel: () {
              setState(() {
                if (_aktifStep>0) {
                  _aktifStep--;
          
                }else{
                  _aktifStep=0;
                }
              });
            },
            
          ),
         
          

          
        ),

        
    );
  }
  
  
 List<Step> _tumStepler() {
    List <Step> stepler=[
      
                       Step(
           title: Text("User Name Giriniz"), 
           subtitle: Text("userNameAltBaşlık"),
           state: _statleriAyarla(0),
           isActive: true,
           content: TextFormField(
            key: key0,
           decoration: InputDecoration(
                labelText: "UserNameLabel",
                 hintText: "UsernameHint",
                  border: OutlineInputBorder()),
                  validator: (girilenDeger){
                    if (girilenDeger!.length<6) {
                      return "en az 6 karakter giriniz";
                    }
                  },
                  onSaved: (girilenDeger){
                     isim=girilenDeger!;
                  },
           ),
           ),
            Step(
           title: Text("mail Giriniz"), 
           subtitle: Text("mailAltBaşlık"),
           state: _statleriAyarla(1),
           isActive: true,
           content: TextFormField(
            key: key1,
           decoration: InputDecoration(
                labelText: "MailLabel",
                 hintText: "mailHint",
                  border: OutlineInputBorder()),
                  validator: (girilenDeger){
                    if (girilenDeger!.length<6 || !girilenDeger.contains("@") ) {
                      return "Geçerli mail giriniz";
                    }
                  },
                  onSaved: (girilenDeger){
                    mail=girilenDeger!;
                  },
              ),
           ),

           Step(
           title: Text("sifre Giriniz"), 
           subtitle: Text("sifreAltBaşlık"),
           state: _statleriAyarla(2),
           isActive: true,
           content: TextFormField(
            key: key2,
           decoration: InputDecoration(
                labelText: "sifreLabel",
                 hintText: "sifreeHint",
                  border: OutlineInputBorder()),
                  validator: (girilenDeger){
                    if (girilenDeger!.length<6) {
                      return "Şifre en az 6 karakter olmalı";
                    }
                  },
                  onSaved: (girilendeger){
                    sifre=girilendeger!;
                  },
              ),
           ),
           
    ];
    return stepler;
 }
 
  StepState _statleriAyarla(int oankiStep) {
    if (_aktifStep==oankiStep) {
      if (hata) {
        return StepState.error;
      }else{
        return StepState.editing;
      }
    }else{
      return StepState.complete;
    }
  }
  
  void _ileriButonuKontrolu() {
    switch(_aktifStep){
      case 0:
      if(key0.currentState!.validate())  {
           key0.currentState!.save();
           hata=false;
           _aktifStep=1;
      }else{
        hata=true;
      }
      break;
      case 1:
      if(key1.currentState!.validate())  {
           key1.currentState!.save();
           hata=false;
           _aktifStep=2;
      }else{
        hata=true;
      }
      break;
      case 2:
      if(key2.currentState!.validate())  {
           key2.currentState!.save();
           hata=false;
           _aktifStep=2;
           formTamamlandi();
      }else{
        hata=true;
      }
      break;
    }
  }
  
  void formTamamlandi() {
    debugPrint("Girilen Değerler: isim=>$isim  mail=>$mail  şifre=>$sifre");
  }
  
}