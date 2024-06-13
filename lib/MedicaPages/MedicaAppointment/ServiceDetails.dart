import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medica/MedicaGlobal/medica_fonts.dart';

class ServiceDetails extends StatefulWidget {
  final String serviceName;

  ServiceDetails({required this.serviceName});

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  ServiceContrat? service;
  bool isLoading = true;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    fetchService();
  }

  Future<void> fetchService() async {
    try {
      service = await fetchServiceByName(widget.serviceName);
      isError = service == null;
    } catch (e) {
      isError = true;
    } finally {
      isLoading = false;
      setState(() {});
    }
  }

  Future<ServiceContrat?> fetchServiceByName(String serviceName) async {
    final response = await http.get(Uri.parse('https://testhebergement-33hn.onrender.com/api/services/getbyname/$serviceName'));

    if (response.statusCode == 200) {
      return ServiceContrat.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.serviceName, style: urbanistBold.copyWith(fontSize: 24)),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : isError
          ? Center(child: Text('Error loading service details', style: urbanistMedium.copyWith(fontSize: 16)))
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(service!.serviceName, style: urbanistBold.copyWith(fontSize: 24)),
            SizedBox(height: 16),
            Text(service!.description, style: urbanistMedium.copyWith(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class ServiceContrat {
  final String serviceName;
  final String description;

  ServiceContrat({required this.serviceName, required this.description});

  factory ServiceContrat.fromJson(Map<String, dynamic> json) {
    return ServiceContrat(
      serviceName: json['serviceName'],
      description: json['description'],
    );
  }
}
