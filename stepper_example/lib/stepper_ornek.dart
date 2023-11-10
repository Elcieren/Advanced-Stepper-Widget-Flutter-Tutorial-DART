import 'package:flutter/material.dart';

class StepperKolayOrnek extends StatefulWidget {
  const StepperKolayOrnek({super.key});

  @override
  State<StepperKolayOrnek> createState() => _StepperKolayOrnekState();

}

class _StepperKolayOrnekState extends State<StepperKolayOrnek> {
  int currentStep=0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Stepper Örnek'),
        centerTitle: true,
        ),
        body: Stepper(
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: (){
            final isLastStep= currentStep == getSteps().length-1;
            if (isLastStep) {
              print('completed');
            }else{
               setState(() {
              currentStep+=1;
            });
            }
          },
          onStepCancel: 
           currentStep==0 ? null:() => setState(()=>currentStep-=1),
        ),
        
    );
  }
  
 List<Step> _tumStepler() {
  List<Step> stepler=[
    Step(
      title: Text('Username giriniz'),
      subtitle: Text("usernam AltBaşlık"),
      state: StepState.indexed,
      isActive: true,
      content: TextFormField(
      decoration: InputDecoration(
        labelText: "usernameLabel",
        hintText:"UsernanemHint",
        border: OutlineInputBorder(),
        ),
    ),
    
    ),
  ];
  return stepler;
 }
 
 List<Step> getSteps()=>[
     Step(isActive: currentStep>=0,title: Text("Account"), content: Container()),
    Step(isActive: currentStep>=1,title: Text("Adres"), content: Container()),
     Step(isActive: currentStep>=2,title: Text("Complate"), content: Container()),
    
     
 ];
}