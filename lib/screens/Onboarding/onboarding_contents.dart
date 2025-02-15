class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Welcome to the Rosca App Committee Buddy",
    image: "assets/coins2.webp",
    desc:
        "Experience the ultimate ROSCA management app. Keep your finances organized with Committee Buddy",
  ),
  OnboardingContents(
    title: "How it Works",
    image: "assets/coins4.webp",
    desc:
        "Create your ROSCA group and effortlessly manage contributions and withdrawals. Plan ahead with scheduled withdrawals and stay informed with timely notifications.",
  ),
  OnboardingContents(
    title: "Join the Community",
    image: "assets/icon.png",
    desc:
        "Connect with other ROSCA groups and members. Share insights, advice, and experiences. Stay up-to-date on the latest ROSCA trends and practices within our vibrant community.",
  ),
];
