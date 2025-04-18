import 'package:dependency/equatable.dart';

class HomeReadHistoryData extends Equatable {
  const HomeReadHistoryData({required this.surah, required this.ayah});

  final String surah;
  final int ayah;

  @override
  List<Object?> get props => [surah, ayah];
}

const homeReadHistoryData = [
  HomeReadHistoryData(surah: "Al-Fatiha", ayah: 1),
  HomeReadHistoryData(surah: "Al-Baqarah", ayah: 2),
  HomeReadHistoryData(surah: "Al-Imran", ayah: 3),
  HomeReadHistoryData(surah: "An-Nisa", ayah: 4),
  HomeReadHistoryData(surah: "Al-Maidah", ayah: 5),
];
