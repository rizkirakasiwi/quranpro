class SurahResponseId {
  SurahResponseId({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audio,
  });

  SurahResponseId.fromJson(dynamic json) {
    nomor = json['nomor'];
    nama = json['nama'];
    namaLatin = json['nama_latin'];
    jumlahAyat = json['jumlah_ayat'];
    tempatTurun = json['tempat_turun'];
    arti = json['arti'];
    deskripsi = json['deskripsi'];
    audio = json['audio'];
  }

  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  String? audio;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nomor'] = nomor;
    map['nama'] = nama;
    map['nama_latin'] = namaLatin;
    map['jumlah_ayat'] = jumlahAyat;
    map['tempat_turun'] = tempatTurun;
    map['arti'] = arti;
    map['deskripsi'] = deskripsi;
    map['audio'] = audio;
    return map;
  }
}
