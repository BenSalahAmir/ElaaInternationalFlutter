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