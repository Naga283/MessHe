import 'package:flutter/material.dart';
class messagesWidget extends StatelessWidget {
  const messagesWidget({
    Key? key,
    required this.mess,
  }) : super(key: key);

  final TextEditingController mess;

  @override
  Widget build(BuildContext context) {
    return Flexible(
    
  
    
     child: TextFormField(
    
  
    
       controller: mess,
    
  
    
     decoration: InputDecoration(hintText: "Enter Message",
    
  
    
      border:OutlineInputBorder(
    
  
    
        borderRadius: BorderRadius.circular(30),
    
  
    
        borderSide: BorderSide(
    
  
    
          width: 60
    
  
    
        ),
    
  
    
      )
    
  
    
     )
    
  
    
          
    
  
    
         
    
  
    
         ),
    
  
    
          );
  }
}