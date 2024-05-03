import 'package:clase18_4/presentation/Screens/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  
  TextEditingController passController = TextEditingController() ;
  TextEditingController userController = TextEditingController() ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
        body: Column (mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Image.network('https://img.freepik.com/vector-gratis/dibujado-mano-grupo-personas-saludando_23-2149202061.jpg'),
            const Text("Introduzca Usuario y contraseña"),
             TextField(
              controller: userController,
              decoration: const InputDecoration(
                hintText: 'Usuario',
                icon: Icon(Icons.person_2_outlined),
             ),
            ),

             TextField(
              controller: passController,
              decoration: const InputDecoration(
                hintText: 'Contraseña',
                icon: Icon(Icons.lock_clock_outlined),
              ),
              obscureText: true,
            ),

             const SizedBox(height: 50),

             ElevatedButton(
              onPressed: (){
                String inputUser = userController.text;
                String inputPass = passController.text;

                if(inputPass.isEmpty || inputUser.isEmpty){
                  print("Contraseña o User vacíos");
                }

                if ((inputUser == "Cambi") && (inputPass == "2007") ){
                  print("Inicio de sesión exitoso");
                  
                  context.pushNamed(HomeScreen.name , extra: inputUser);
                }
                else{
                  print("Inicio de sesión fallido");
                }
                }, 
              
              child: const Text('Login'), 

            ),

            
        
        
        ],),
      );
    

  }
}