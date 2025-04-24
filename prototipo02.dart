//PERFIL DE ARTISTA MUSICAL

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const ArtistProfileApp());
}

class ArtistProfileApp extends StatelessWidget {
  const ArtistProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil do Artista',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          secondary: Colors.amberAccent,
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ),
      home: const ArtistProfilePage(
        artistName: 'Coldplay',
        genre: 'Rock Alternativo/Post-Britpop/Pop/Pop rock',
        bio:
            'Coldplay é uma banda britânica de rock fundada em 1997 na Inglaterra pelo vocalista e pianista Chris Martin e o guitarrista Jonny Buckland no University College London. Depois de formar o Pectoralz, Guy Berryman se juntou ao grupo como baixista e eles mudaram o nome para Starfish',
        albums: [
          'Moon Music (2024)',
          'Music of the Spheres (2021)',
          'Parachutes (2000)',
        ],
        featuredSong: 'Hymn For The Weekend',
        awards: [
          'Grammy Awards: Gravação do Ano (2004)'
        ],
        socialLinks: {
          'Instagram': 'https://www.instagram.com/coldplay/',
          'Spotify': 'https://open.spotify.com/intl-pt/artist/4gzpq5DPGxSnKTe4SA8HAU',
          'YouTube': 'https://www.youtube.com/user/ColdplayVEVO'
        },
        fansCount: 1234567,
      ),
    );
  }
}

class ArtistProfilePage extends StatelessWidget {
  final String artistName;
  final String genre;
  final String bio;
  final List<String> albums;
  final String featuredSong;
  final List<String> awards;
  final Map<String, String> socialLinks;
  final int fansCount;

  const ArtistProfilePage({
    super.key,
    required this.artistName,
    required this.genre,
    required this.bio,
    required this.albums,
    required this.featuredSong,
    required this.awards,
    required this.socialLinks,
    required this.fansCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _ArtistAppBar(artistName: artistName),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ArtistHeader(artistName: artistName, genre: genre),
            const SizedBox(height: 24),
            Text('Biografia', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(bio, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.justify),
            const SizedBox(height: 24),
            Text('Álbuns', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: albums.length,
                itemBuilder: (context, index) => _AlbumListItem(album: albums[index]),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              featuredSong,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 24),
            if (awards.isNotEmpty) ...[
              Text('Prêmios', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              ...awards.map((award) => _AwardListItem(award: award)),
            ],
            const SizedBox(height: 24),
            Text('Redes Sociais', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: socialLinks.entries.map<Widget>((socialLink) => _SocialMediaIcon(socialLink: socialLink)).toList(),
            ),
            const SizedBox(height: 24),
            _FansCount(fansCount: fansCount),
          ],
        ),
      ),
    );
  }
}

class _ArtistAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String artistName;

  const _ArtistAppBar({required this.artistName});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Perfil de $artistName'),
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
  }
}

class _ArtistHeader extends StatelessWidget {
  final String artistName;
  final String genre;

  const _ArtistHeader({required this.artistName, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage('data:image/jpeg;base64,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'),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(artistName, style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: 4),
              Text(
                genre,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.verified, color: Colors.blue, size: 16),
                  SizedBox(width: 4),
                  Text('Verificado', style: TextStyle(fontSize: 14, color: Colors.black54)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AlbumListItem extends StatelessWidget {
  final String album;

  const _AlbumListItem({required this.album});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(album, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}

class _AwardListItem extends StatelessWidget {
  final String award;

  const _AwardListItem({required this.award});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.military_tech, color: Colors.amber),
      title: Text(award, style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}

class _SocialMediaIcon extends StatelessWidget {
  final MapEntry<String, String> socialLink;

  const _SocialMediaIcon({required this.socialLink});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch (socialLink.key.toLowerCase()) {
      case 'instagram':
        icon = Icons.camera_alt;
        break;
      case 'spotify':
        icon = Icons.music_note;
        break;
      case 'youtube':
        icon = Icons.play_arrow;
        break;
      case 'twitter':
        icon = Icons.flutter_dash;
        break;
      case 'website':
        icon = Icons.web;
        break;
      default:
        icon = Icons.link;
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon, color: Theme.of(context).colorScheme.primary),
          tooltip: socialLink.key,
          onPressed: () async {
            final Uri url = Uri.parse(socialLink.value);
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Não foi possível abrir ${socialLink.key}')),
              );
            }
          },
        ),
        Text(socialLink.key, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

class _FansCount extends StatelessWidget {
  final int fansCount;

  const _FansCount({required this.fansCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.people, color: Colors.grey),
        const SizedBox(width: 8),
        Text(
          '${NumberFormat.compact().format(fansCount)} Fãs',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
