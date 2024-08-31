import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'drop_down.dart';


class DeleteShramikSandhanAccount extends StatefulWidget {

  @override
  _DeleteShramikSandhanAccountState createState() => _DeleteShramikSandhanAccountState();
}

class _DeleteShramikSandhanAccountState extends State<DeleteShramikSandhanAccount> {
  final _formKey = GlobalKey<FormState>();
  String _phoneNumber = '';

  Future<void> _sendDeleteRequest() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      //final url = Uri.parse('https://35.228.10.19/api/api/v1/selectlabourbyoccupation'); // Replace with your backend endpoint
      final url = Uri.parse('https://www.cjsoftwaresolution.com/api/v1/selectlabourbyoccupation'); // Replace with your backend endpoint
     // final url = Uri.https('www.cjsoftwaresolution.com', '/api/v1/selectlabourbyoccupation'); // Replace with your backend endpoint

      print("_email $_phoneNumber");
      try {
        final response = await http.post(
            url,
            headers: <String, String>{
              'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            },
            body: jsonEncode({'Phone Number': _phoneNumber, 'Occupation': OccupationDropdown.occupation}));
        print("response $response");

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Account deletion request sent successfully, Your Account will be deleted in next 30 days. Thank you'),
              duration: Duration(seconds: 30),),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to send request. Please try again.'), duration: Duration(seconds: 10)),
          );
        }
      } catch (error) {
        print("error ${error.toString()}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Phone Number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phoneNumber = value ?? '';
                },
              ),
              SizedBox(height: 20,),
              OccupationDropdown(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _sendDeleteRequest,
                child: Text('Request Account Deletion'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}