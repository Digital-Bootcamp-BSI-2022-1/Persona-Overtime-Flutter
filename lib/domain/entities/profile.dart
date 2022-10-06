class Profile {
  final int id;
  final String nik, name, role, grade, employment_status, phone, email, ktp, npwp, join_date;
  final int idOrganization;

  Profile({
    required this.id,
    required this.nik,
    required this.name,
    required this.role,
    required this.grade,
    required this.employment_status,
    required this.phone,
    required this.email,
    required this.ktp,
    required this.npwp,
    required this.join_date,
    required this.idOrganization,
  });

  factory Profile.fromResponse(Map<String, dynamic> response) {
    final id = response['id'] ?? 0;
    final nik = response['nik'] ?? '';
    final name = response['name'] ?? '';
    final role = response['role'] ?? '';
    final grade = response['grade'] ?? '';
    final employment_status = response['employment_status'] ?? '';
    final phone = response['phone'] ?? '';
    final email = response['email'] ?? '';
    final ktp = response['ktp'] ?? '';
    final npwp = response['npwp'] ?? '';
    final join_date = response['join_date'] ?? '';
    final idOrganization = response['idOrganization'] ?? '';

    return Profile(
        id: id,
        nik: nik,
        name: name,
        role: role,
        grade: grade,
        employment_status: employment_status,
        phone: phone,
        email: email,
        ktp: ktp,
        npwp: npwp,
        join_date: join_date,
        idOrganization: idOrganization);
  }
}
