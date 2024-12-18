class Committee {
  final String name;
  final String description;
  final double contributionAmount;
  final String paymentCycle;
  final bool isActive;

  Committee({
    required this.name,
    required this.description,
    required this.contributionAmount,
    required this.paymentCycle,
    this.isActive = true,
  });
}
