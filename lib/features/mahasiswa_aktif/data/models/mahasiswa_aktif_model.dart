class MahasiswaAktifModel {
  final String nama;
  final String nim;
  final String email;
  final String jurusan;

  MahasiswaAktifModel({
    required this.nama,
    required this.nim,
    required this.email,
    required this.jurusan,
  });

  factory MahasiswaAktifModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaAktifModel(
      nama: json['name'] ?? '',
      nim: json['id'].toString(),
      email: json['email'] ?? '',
      jurusan: json['username'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'nama': nama, 'nim': nim, 'email': email, 'jurusan': jurusan};
  }
}