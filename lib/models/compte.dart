class Compte {
  final String email;
  final String password;
  Compte({required this.email, required this.password});
  Map<String, dynamic> toJson() => {
        'email': email,
        'mdp': password,
      };
}
