class SpotifyTops {
  final String isrc;
  final String name;
  final String artist;
  final String albumName;
  final String image;
  SpotifyTops(this.name, this.artist, this.albumName, this.image, this.isrc);
  factory SpotifyTops.fromJson(Map<dynamic, dynamic> json) {
    return SpotifyTops(
      json['isrc'] as String,
      json['name'] as String,
      json['artist'] as String,
      json['albumName'] as String,
      json['image'] as String,
    );
  }
}