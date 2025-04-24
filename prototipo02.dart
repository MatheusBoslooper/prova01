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
          Album(name: 'Moon Music (2024)', imageUrl: 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxISEhUSEhIVFRUVFRUVFRUVFRUVFRUVFRUWFxUVFRUYHSggGBolHRUVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OFxAQFy0dHR0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAOEA4QMBEQACEQEDEQH/xAAbAAADAAMBAQAAAAAAAAAAAAABAgMABAYFB//EAC4QAQEBAAIABQIEBQUBAAAAAAABAgMRBAUSITFBUSJhobEGcZHB0RMycoHhM//EABsBAAMAAwEBAAAAAAAAAAAAAAABAgMEBQYH/8QALhEBAQACAQQCAAUDAwUAAAAAAAECEQMEEiExBUEGE1FhsSJioXGR8BQyM1Jy/9oADAMBAAIRAxEAPwDzOSvRaeP3b6anIpP2jaFwlME2SojSWXRKhLCVGEAoEAjCg2EAAAgXSaqJ2JXAsBp0lQtCiJMKRloMNQjLQZaRgRspBgDut6dTTzsqXKUUjTXCUGTQOJ6iayROwlBSMpGzoALCMAbKQCgFI2XKLVa0WwFEdUMkJSUWkZSUSpMLAZaRhQYdEZSNkIB0A7nTqvNwmiXEdBcIFF0DiWk1cJSUWkYUGwgFgMOiNhBnpFOS26V4uFhyzbfFw/dJyZ91Yy1r8uU7tRHki7E4tfSGWFpKJSOFpGFhGUjLSMAZegYWEYEbCDudus83EdEuJ6JcJQotBxOkuEqVFoMLCAEbLAGdEYdEGz4fhYs8m90/DbNrcmPTP5seP9VV1Of5WGp7rU5W1JqOZj5anJU1sYo1C4SkoCMtIy0jLSMCMoMOgYEZSNhE7jbrPORLRMkSoUWkotBwmiVCaJRaRgRgDYRDMlavHG1bh4WLLNt8PBd+Xq+E4WlyZ+XZ4sJjhutbxM+f0b/T8fjby3U895eW36ebzs2SsGpyMNZ8UqhZKSgoMvRGBGWkZaDCkABlpGFI2EHcbdZ5zFHRLhKFwlJRaAShcJUqL0DZUgoMEnpscHGx51ucHFt6fBwd+zT5M9O3wdP3N7xHH/p56+tYunn5uf8Ao1PmuacHH2Y3zXi+J07kx7Y8zxx5/Iw5VtYtbbHWbFKpWSpUWgwpGBGWgARs1CMoAUlFBgQdxuOrXnIlYS09BUJQopGWhRKVUWpMCMKAOU1kx3b4b/huNrcmWnZ6Xj3p0Hl/B+Tk9Ryz9XpOLDsw20/NN26v5e0db47h1hL+r598l1P5/U5X6nh4XPp0M6x4RpcmmCtjGI6Y6yRKkuEpKCwjKRgRgAFIwIBQZeiOFsCmAO75I6rzMR1EssS1AuJ2BRaRloOEpVRalRSMKAtw5Ysq3OLF63gOHuxo8+epXo/j+Hdm3W8HHM8dvX09nnssry9Rjxtz5vqZ0vR55fenK+a3p7riw7MI+Y9Pu+a8LmrHnXSxa22Ks0S0iskTqVEoMLCMpUwsIwoNnRAthGFALQotI2dUjd1t1nmYlomSJapLidCoSkqFoMtTVEpHC0lAA2vDRg5HS6aePL3/ACfi7rldXn2416743j3Nui8x5Jnjk/7/AKOP8Bx5dR1nJy5esfEeX/GnU25cfTz/AFriPMeXu17/AD8TTzfBjqPK5K1Mm7ihtFZIlUVkhbEmWwGWwjLQqARhSAUGFiQAMlgVC0jAtB3e3WeaieirJENEuEoVCUlF6BhYmmWwjLYSoXoKkbvhstbkrsdJhXU+RcPw858rzXHjyse16Hj7ePbZ/iDk+eviTr+/923+D+GzpfzL7ytr5b8/z/n/ACef9up/z/dxnir7vVcrHxemhyNWtrFDSayQlSqFqVBqECUKhbCMtIwIwoMCAUjIFQL8fzI2em/agO526rzUS0VZIlolQlgXCWEotALSqi1JhSUbjicmbi9t3w0avL6d7ocd2R2fkPF317PEfiDm7eOyX29jL2cO2r5/r5/nf3e5/DvD+V0PHL+kfEc+S8vV8ud+8r/LjfFOjy+3U42npr1sRLUSuEqaqFsSolI4Wgy0lFpGUjhaDYRhSBKFQpGwE7rTqvNxPRVcT0SiWBcJckuQtgBKRlsSoCVDYnunJn4pvJ6Pgsd2Rpc+WpXpvjOPeUd95Djrq/aV85+fyufJjjHouvz/AC+myv6SvC8/6+7618fh2dPjj+kj4d0dtu65HxHyfI7mHpq6ywVnlT1CXKlqJq4SxKi0jhKSiaBwtqVFpGwGFIFpGSgwJTATutOq83EqFQliVwCrJjdE7C5fBKBPZNQjJ0mnJsOiVIfjyjKtriw8x7HlPHLqOb1WVmNeu+Iwm3eeVcf4dX7Zv7Pm/wAhyd3W4Y/3Sf5bnz2Xb0XL/wDN/hzXn0932jp5rij4x0V8OU8RPdi5Hcw9NXbDWeJbSuJaTVwlTVQtIyaJUJSUSkoCMLQZaQCkZaDgUGHZB3e8uq83E9QKidhLhKS5SWkqEtBlJUo3CNsnZdF9BbXMf2V48seTb4Zt7HlE/FHN6z/sr1/w88voPlP/AMt/8a+Wc1s67C3/AN5/I+fm+l5Z/bf4ch/EE933bg/8UfHuh9OZnBrevTn5vf6TutbnzmE3Xoel4suXOYY+60NxjXpLRKiWiqy1KiVJkpKT0SoUlFI2Ay0gBGWgy9hTCJ9B5o6cefym/LW1FJhdpZNpaJU9J0HCWBU8qYwx5VsYYaHeksly34S1otDv+jcU+ycmzw/s9nyr/dHN6uf016/4i6une+SX8Gp+V/Z8s66dnVb/AEyn8s/zWHdwZz+2/wAOU/iD5933TpbvhlfFeh9Oa4fFXj5JuT479r9Zfaz+jX6jjnJjcXpOj5rwcmOc+ml4jUurczqfSX6Mclk8rzyxyytxmpWvoFEtFWSEqaqESolI4ToKLUqKRgDLaRlsIwoMAGAPoG9OlI8/3bQ1DEidhK0TolwOks08hqEy60yIq55Z0S5NF1ISrJS5nScvLLxztr0/L99ajS6jHeNen+Lz/qdx5Nuf1nT5x87xZTOZa8O11uH5nFZ+znPPr1eu31v4zk7+lwy/WR8O6bC4ZXH9K5bnZs3Xwau2CtiJaSqJ2EuJ1K4S1JksJcJQZaky2EoAZaRlpGHQDAD+mfefr/gB3djpvOYbJYTNL+qNhK0HRVlxxmk9A9/QzPaLWbGbZYlkm4WwlSF7JUvknZaVjfLb8Nq9xrcsmnc6DO9007DyTd6eR+Y6fHkxsepwvdh5aPnfh56tX8//AF678O8vf0eE/Sa/2fGutwvD1vLx/plf8+XK+Jx1XXzjY47uNPbXrZiOkLieiXEqirhbSUSkZbAotSZKFBSMtIwsIADZ0AwE+hXLo7cSYz6JuEvXlr7nRl6J0m1kxm2XjLbL2SDnKLWbCedhuJZbrSOzY6lb+QTv9g452nKs3FJfLe8LGry+ne6GyV1HlvJ11O3C6nj7tvTcWX0zz69/H1n6/H+G9+Gt8WOXHb9/y+Zfifp/y/kO/wCsp/mf8jkfGZr1Occ/isebyNWtvFLSGSJ0lk0iqhO0qKDJQYdJUQGWkYUjCgw6IMAEB9C6dCuLhP1S0FfslcdlayTHfsLOk+2STRda7JfuFtJcoQqvHzE+WFCyhLkWqmI440Ws+GDY49dVgzm3S4Mu2vX8Bze893P5sPDucHL3PX8dJeOX56/atb4/O8fVftXnvxb0v5nBjy4+8b/iuS8xnzfh7K3eLx3B+jx+Rq5OhihpDJE6VWTSKuFpGWkZaDLSMtJRaRhQZSNhBlgDOwH0myN1zZjNbR1AeoluEvSO4NlZfpO4p7ElH0I2zTFnRVkn7E1CUjrQ0mW7UzUVs4ejSsWUbWFbHBuysGeLf4OSx7vhOS7npv2c7knZlMp9NzquP/qOnyws9x4fmPD129P03JOTCV80mN487hfceJzRWbdwrW3GFmiVKrJU1RalRKRloVC0jLSOARgDAgBGMBM6A2+iaxW9tzJjZWXCdsvbU9YLa5A9JbZJEuTI2mxOhcDVJe9IcmxpNzS9QKZSsu+k6ZplIbPIixmx5FuLf5sWWLb4uR6PgvG3N+Wny8MyjrcPUfVHzX8X4pPn9218dyds7L9PIfN9NOLn/MnrJz/iePp1so0ePLbT2wVniOk1khNIXCUjCwjJYFFpGWkYUjAGHRAZAA6IM6A2+mabTVJ2SoTYNHVAa+9npNyQtNMv2TXINH3l1nsl63EZ7Cpx8QfXE2VlmeN9j2ll3DorLjkrxbYs43OLkejeaXPVa2ONwz7oydfx49Rw9t9vG8TY7WGfdi8hjjcbqtDkicmzi19RFZYSpqi2JMKRlsB7LYRk6JQWEcYDAALSMOyA9gn03UbLX+kZDogcmU7ZO3XtDcMq1dxTFpHZlZpGHUY+x7SzSk9iOdt9ocvtTjFn4p869vhFnlsY5/0+YOuSF2r/ADJo3HtGUZuPNv8ADWtn4dPi/qjV8bxde7Y4OT6cP5Dg7M+6T287ljbvlpYtfcRWaJWIWHSTDoGFIFpKJQZaSikYEYdAMID6QH1Dln2Z4wa8Nf01VE8J8+ykPLJq72rSLl4a/JpUjFbdNfk1VRNyv2TOhYMLIzXJOk6X3STwh3TY92lJU8+wmiOZfQ2EuHz7IrYwuvba4OZhzxb/AA8q160xTeLNzYTlx083n4+rY3ePPujz2eF48rjWtrC7DlR1E1cpEVRSUWkZaDLSOEJRaRsAAjZSoZ0A+qckZ2HFr7MVrbz2Np1tren3VtEm6ly4OUrjvw1eXPS5dsWWOvaNNHtLQAdppy6LaFBaQGykyeYX12FYeOVxVxr3RlGzx5zbd4p9mvk6PHd+luXw0sRhyXGp6ro5njv7eZ4nHXs38cplHCuFwy1WnyFWXFGoq4UlFIBSMlCoSkqARgAzsjAgwB9Z3ll2xaR5cHtevDU0E1DWYe06Q5YqFrUanPF4sPJPG2npbAmAzpJyBrJbXotgDCV9D6bS2ySWq44fdFyZsOPzuN7j9p7sOU23uO2TylvxlzS/K2q9V2+Gj4jl9V7ZsJ2uZ1F7rtrbWxRGxNjJKWwjCkAoMuoRxOkstIwAZ0Rs6AAB9h9PYTGt4qLxVk8/likIaz7GXbtrculRFqO/cys21OXK5WDLH6a5scP30ll3rwKVybC4G1TGz2OONNqscB76+he2WXQTmHaX5vnUVlsnvU6jLLdeWhy77ZJNNPPK5VKmmGmPbtG/Kuy2bielbKJ1NWS6SrQABYRksI9l6JTOgNh0DKQZ2Nw9PsGdfQUvaHJPoqVX+rU5ePpUpaa2jJqc3uqIym2prXSmLer5R5fuacp9xq1TAfjx9U5Vm48N+apYhm15DQVQ9RCVK6vatMcttLQPXkLv2GvJXO9uqibEWlVSl/1LPZNjJMrrSd0RaJQYdA2UgFhAtgUFhDZdUlQlCi0jDsg+v8aqWJOQRf21vFqxFaGlIn219nENXmXGPJHm+BPac/TW0phntbi+GPJt8foKYpaQnokBBsQUkMoTmOMefpKBBKFQuk04nUrAGIIdAoT6Eot+SOBSOF3/ALf+7+0JcTIygwAf/9k='),
          Album(name: 'Music of the Spheres (2021)', imageUrl: 'data:image/jpeg;base64,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'),
          Album(name: 'Parachutes (2000)', imageUrl: 'data:image/jpeg;base64,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'),
        ],
        featuredSong: 'Música mais tocada: Hymn For The Weekend',
        awards: [
          'Grammy Awards: Gravação do Ano (2004) – "Clocks"',

'Grammy Awards: Melhor Performance de Rock por um Duo ou Grupo com Vocal (2003) – "Clocks"',

'Grammy Awards: Melhor Álbum de Música Alternativa (2004) – A Rush of Blood to the Head',

'Grammy Awards: Melhor Performance de Rock por um Duo ou Grupo com Vocal (2009) – "Viva La Vida"',

'Grammy Awards: Melhor Álbum de Música Pop Vocal (2009) – Viva La Vida or Death and All His Friends',

'Grammy Awards: Melhor Performance de Rock por um Duo ou Grupo com Vocal (2012) – "Paradise"',

'Grammy Awards: Melhor Álbum de Música de Rock (2016) – A Head Full of Dreams',

'Grammy Awards: Melhor Performance de Música de Rock por um Duo ou Grupo com Vocal (2016) – "A Head Full of Dreams"',
        ],
        socialLinks: {
          'Instagram': 'https://www.instagram.com/coldplay/',
          'Spotify': 'https://open.spotify.com/intl-pt/artist/4gzpq5DPGxSnKTe4SA8HAU',
          'YouTube': 'https://www.youtube.com/user/ColdplayVEVO'
        },
        fansCount:92700000,
      ),
    );
  }
}

class ArtistProfilePage extends StatelessWidget {
  final String artistName;
  final String genre;
  final String bio;
  final List<Album> albums;
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
              height: 180, // Increased height to accommodate album name
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
      backgroundColor: Colors.black,
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
          backgroundImage: NetworkImage('data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxISEhUSEhIVFRUWGBYVFRgXFxUVFRcXFxUXFhUWFRcYHSggGBolGxUVIjEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGhAQGy0mHyUtLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLy0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAOEA4QMBIgACEQEDEQH/xAAcAAAABwEBAAAAAAAAAAAAAAAAAQIDBAUGBwj/xABKEAACAQIDBAcDCQUECAcAAAABAhEAAwQSIQUxQVEGEyJhcYGRMqGxBxQjQlJywdHwM2KCkrIkU8LhFRc0Q1SDk6IWNWNzlLPS/8QAGwEAAgMBAQEAAAAAAAAAAAAAAwQBAgUABgf/xAAxEQACAgEDAgMHAwQDAAAAAAAAAQIDEQQSITFRBRNBFCIycYGxwVKR8CMzQmEVodH/2gAMAwEAAhEDEQA/AIoFKAoAUoCvY4PnbYUUIpcUIqSMiQKFHQrjhMUIpUUcVx2RIFKAo6E1xGQUQoUdcQHFCKANHNSQIiiil0RriciKEUqk1BIVCjojUEhUcUVAGuJDiiihQqTgRQoUc1BwWWkmliiIrjsiKFKihXE5HAKWBRClGrA2wqImgaFccFFCKOhNQSACjNFQriAUKOKWLdcSk30G4oU51ZoZKjJ21jdHSjSakqHREUKFccIIoUo0VcWE0VKNFFQSJoUcUK4kKjoRQArjgUBR0IriAqOhQFccCKFHFHUnZFGhSgs0ChriuGJo1WlraNPJaqrkgtdTl1IxSlG0RUvq6Pq6r5gwtMRxapBt1LKUBbrlMmWnIyWqkKlK6unFFQ5ZLV1bRlkoslSctFkquQjqIxt0y1qpzJTTrVlIDZSn6EEihUlrdNNaoikhSVUkNEUUU51ZpBFSVw11ExQilU4ts1zeCYxb6DQSldXT4WjihuQzGlDISl5KcC0sJVWw8ayMbdJa3UorSCtcmRKtEMiiqS6Uwy0RPInOvaFNChFCpBk1LUU4Ep1UpwJQXI04UpIZC0oJToSlhKo2MRrKjbe1EwyZm1JkIvMxx5DdJrAY7b2Iu6s5y8AvYWZ9/nVhti22KxhUnMMxVMp0yA6x4iZPfW62VsaxZXsWlE7ye0xjmx1NYOs1knJxXQ9T4f4fGMFJ9TmWztr3bTCLpDE6BiTbg8CJjlHnFbPo70gF6EukB+BGgO6J7zzGlW21eimGxEllysRqUOXduJG4nvia59t3Yd3Z91HVi9otoxHaUxuaPDQjkaFp9ZKD6/QLqvD4Ti8r6+p07LRhKLA3hcto43MoI7wRoakZa9EpZWTysq8PAgLQK04q0sLUNkqJGyUh7dTSlNslcpEOsglKSUqW6U2Uq+4C6yI6UzcSpjLTbJVlIDOrJGtpTwWlBKRir62kLsYA9eQA7yaiUscs6unnCQzjcUlpS9xoA9T3AcTVbbxmJu627KonA3iwY+CKNPOhsvCNiGGJujfBtLPZUGCDHFu/9DQdTwrz+q8Um5Yr4R7DQ+BVRhuu5f8A0iJZZo7QE8YMj31IV5oYZ0dzbEBl3iZbzA3eEzUbG584KgkA5YGWCOLaidOQNE0/irbSsX1KarwKO1yof0f4/jJRFJilpSstbaZ5mUOeSMy021upZSkFasmBlXkh9RR1Ky0KncwXkR7E5UpYSloJ4U4BS7ka0axvq6Tc04T6fjUikxuPKgXzmq24dRzS1Vu2Ks6epiejeyblvEX2uFS2igrqDnHWGJG4SB5VM2j1tpx1Zvj94MjoJ1OZHOi+FP4a+PnTsD2CQJ3SVAH4VfYorlJMTExpNeWsm28nrq4KKwhnB4z6LNeZVZdGI0U98HdPKqTpI9vFYS71Tq4ykqVIMOuqgxuMgU7iGW4qWhIZmLGVG4AwwOoPA7z8ajYHZD9cmcDNMu6gL1iKJ7YGk58nlV9PFymkV1ElCDbLbo3s5rFhbTMTlzATEABiBl0nLEETJ1q0y06EoZa9VD3Ukjx1q3SbY2FpxVo4pS1LZWMBLLTbLUgiiZajJLgRGSmmSpbJSGWrKQN1kJ0pspUu4lNFaumBlAYy1junmPhksAxIzHxJhfQA+tbgLXOummH/ALZ3sqFfQCPUGlNdNqrgd8OqTu59C66I4hjbVGJ0Gk8uFaqysnTju7u+sfhdkYlbQe2uQ7hn7MAfaG81f7NxzAhdJHHn315iz4j2dedvJNxGDyLniAo5b40Enj51BvX2kFDGUSezJ3fVJMAzzB05Va4u6XUDhoSOEiTr5x6UwloRBQOd/agW1P3Qdfj31GOS8ZcEHZ+K6yZMsDryEnQelTmqDYdesaFRSQJyjKDAgaeFWCCa9N4fNyoWfTg8d4vUo6mWF15GjQy0/kFIYU9kynDA3koUrLQqcldpaqBukUh2A41XYa8mbRh+dNYnFKIKmg4HfMWMloGBpq88T3VAs4ozFM4rbSHE28IvadlZnP2QASB948uAoV01XFyYxp4u6aiig2pjWsXSGAhmzITuIYyRu3gn0irVcOro10kk65pGYDX7MyRpz4VO2vsm3iLRt3BxkEb1PAg8DWYurisEZK9dbiMyDtRwzpvmOI91eUks/M9hGePkS8LdFu8HABVpUwZABO8BtU46a76uNhXXvXXuT9Gg6tf3mMM7eAhQPPurO7GD7RB6t8ltWi40QRMkogjUxxO6RvroOFw6WlCIoUDcB7yeZ761NBp5Z3y4Rna/VQacI8jgFA0qabxb5EZ/sqzegJrXcklkxdmeCHisblOVdT7hUcYq6upgjjpGncRuqsxGPt23i40bvwHid43VZtiE6vPnXLHtEwPU1hW661zynhG/VoKFBJrL9WWuGuhhIp4iqfYF6WZZBU9oEajkY91XhFbNF3mQUjE1Gn8qxxRQ9JdsLhbRYwXIItr9pu+OA41zTGdJsU8k3XE7wpyqO4Bfxq36UsMZtFrKN2bSqtxoBykTK2wd5k7zug76nN0Swa2y7pcaBv6y6WJ8FYAegFI6jWqMto3ptBKcd33MvsLpBes3B9I7KT2kdpUjjE+ye8eddTtOHUOplWAIPcawmD6OYa48g3MoOqZ8wGk+0wJB8CK03RTCPZttaa5nVXfJIMqumVSePE+dE0usi3t7g9V4fNRcuxbZap9u4HMbd9UzvZYNlG90+so/e4jvHfV9lpJStCyKnFxZmVOVU1KPVFVhOkeGuj9qildWzwrQDEMjweEVWbauKrC9ZHZJ18OBHcae6RdEkxH0ltupvAyHG4n94fiNfGomzsPfQdXiF7U6NMq401U+e466V5/U6WVXPVdz1Ok1kLuOj7E/A7SBGp0NJxePCGc+m/SlWtmqpgLAPp/lRbS2Ygts0cCfdSsY5GZywV2C2gL9yLKsQD2niFHieccPDxrToQKoNh4y2ot4aQtwIDERnmZZTxMgkjfvrQW1r0eirjCvh5yeU8Qunbb7yxjgKhSytJincmc4hRR0rLQriuDj1/at5DHW3J0nttv386P/AEtfGrXn3T7RgDmRUG57TORvLRPu91IuAwSRvIJnfp7Ijlu07hWJvl3PReXHsWlzbuKUKeuYZhMcQD7M98a+lTfk+Zn2gh1JIuzz9gk1R4u52VmczknfuCr+vSr/AOTK8tvaNo3DAIuKp4ZmQhfXUeJFCulJxfqEqSjJYOqtbjSqrbGHN0C3JCzLxxA4ee6tu9pW0YA+IrKdPMdbwWH6xbZZ2JRNeyrZSQzzvAjdWfD33waXmpLkrejW0Ee7icOoymyU1G4hlgj+FljzrSKoABJ31wDBbQu2HNxXcNPaIMZiST2ucmTrXTuivTG1fUC4BbcaH7BP+GfT4VuaexKKizFvi5Sckba2AToRVf0pAXDXDEwJ9xH41MRxyj9TTO1MIb1i7a4sjKB3lezr4xRrY7oNFapbZplGmHt3RnIBHtAxroZBE7iCB4EVAZLd8LaExDkgZhE6Src9+orK7K2wTbNpyYH1ZyyQMuU6bt5p/D7QS04uDPbZRqCwcMNBk8wBv5V5xxeT0kZRcTadGLPV3SgOaVdiSdR2kgd/LyrVAVlugStcW5inWOtYLbHJEnd4sW9K1hFb2ki41LJgauSla2jm+2uhvzd7mJsvcbrC5cE6hmYsIKgdnU9+g3zTmCzW5QuSpWe0xOobcMxJmGXSTqK3uJtBlKncQQfOuXbWs3DcW1ddUNomTMZywyhhxgprpxkcKz9fThqS6M0PD7k4uL6roaxLqdXmWDpz1qL0UxZuG5PMMO4EFY9wrJ4gYe0kozlgTrqqmQZjeQIB1mn+jO3fm9u9imtvctytsdWBMySW7RHZkxpzoGkwrE30D6x/0pJdWdLCURSqbov0rs40sqgo6icrEEldJYEaGCYI8OdI6TdLsPguyxz3f7tIJH3zuQe/uNegVixk846+cFnjsTbs22u3WCoglj+AHEk6AcSa55gNt3cVifnDHLbzdVbtzOUe1LcM3sieJeOArOdJel93GEC52EUyttZy+LHezd/uFH0fxyqxtM0C5lKHk+7Q8/Zj7vOlLZK73M8B4SdGJpZx9vU63bt5t1N47Dk2ys74nwnX3VU7I6Q6EXElhoSpgeIB3A76nPt6yTDh1HE6Ee4z7qQ9kuj6GmvEtNL/AC/cwvTGVNq4sqRKqRvDCGEd8iqgdJ8WkEX7k6yC7MPRiRUrpltlLzpbRDlQuwb7edoOkaRlYeIPKswqQDR6N0YiuqcJzbRpbXTrHD/eq33rafgBUuz8omKHtJZb+Fwfc9ZCzaZoCgknQAcaQvLjTCtl3FXVB+hu/wDWTc/uLf8AM1Csb/o2/wD3N3/pv+VCp9ol3I9mh2Jd+9JngNF/E0hRJEma3fyddG7F9Hu4i3nh8iAswEKoLGFIB1PHlWqfovgLyBkwyKCNCsqeUgilsDmDjmMaSgHB8vkQal9HLhGJtHiGnzCkifMVH2mFW9FskqLzhSYJIGgJjuNSujn7YOdyJcuN/CjH4wPOqs71OgbH+U+5mT51at5GMM1oOrJOoJRmbNHECPwrQfKXheu2e7oQQmW6CNQVGpI5yvxrjKGWDHcSI/lMfE10zZ21ra7CZXuKXFq+oTMM8G46J2ZkAAr5RS861GSce4aM8ppnIcWkBSNx954/l5UjDYhkMjiIIO4g8DT62Wu6bgijfuHE/jUS9vgUwLnSuh3Tbq1KXszWlAykdq5bO4L+8pO7lPLQQOmXTM4kjq2NuyAGVW0ZzvlgpPpw8axGGvMhlT3HvFR7qanxPxq7tltwRtWcnT7uxsNtAfOMLdW3egG4B2h2hMOn1W0Oo5HfVNiOi2JRXa5ctwoJ7BYkneAAQP0ap+gu0Ooxtkn2HYWrg4FbhyyfBip/hrt+0dhW3gZmE7xoQRx92nnS3lSfQdhbCS94Y6FbZtYmzkS31NyyAlyyd6GNInUqef6OiKVw/bm3nw2NxF7DOFK37VpNAQy2rL27qMN7LItz35TMgGtv0W+UuxiCLWIAsXTABn6Fz3MfYPc3rwrQquT91mfOGOUbJ1rDfKVh7IsC6xy3lIFnLq7ksPo8v1l+Hxuem3SpcCgCgNecHIp3ADTM3dOkcfI1zDYWIuYzaFpr7l2zMxLboRSyhRuADBTAgaVN8k04nVpppjGz8BicVc6ogpbUy++QNNBPE7qd6X7XRFGBw+iJpcIO8jTq54/vHidOdbPpK/zPD3b1sdolYk6S7gGOO4sa5FYQsdfGazoVvdyO22pRwur6kzAbQuWTntuUcAgEaEAgg+4mobzMtrOpnjO8mn7duDS3WB4fCnlHgQbIVy3GvClKkcT3fmKl9WIjeDUUIVMHy7+VQ44eSUzZ7KxRuW1uD2x2WG6SIkHx0I5T41bBc4kcd4Ond5VjOj+M6u6AT2HhTPA8D5Ewe5jW1a2yywmfrAAMWgQCASO1pz1ina5ZjkyL6ttm30fQx208GQzL990371aLqjugB/JudVBWOH510HbOCDW7ULBUFc31m6xWtDOOYLjXl4VgbiESPKgThg0KZ7oitmx2lJy5gVDQWiSuaAOJQuPPhvq4xG1DaRESwLUAlGYDOD9W4jASzZSZJ0kiAMomjtXipGUxGo0/U1I2ptB79zO0xwXSBw00A91LOKb5GlLCJn/ibE/3x/6dn/8ANCq3L3GhVvLj2X7FfMl3On9E9uYKxhbVtryBoLONSQWJYgwO+Kt9p9KsILD9XibZbq3yKrAMWykKAN++uX4HZTiWZd26CG85UkU1icE5ZsltyBG5SY4ncO+qLIfLwQbh9juZj6KPyqz2asWLzfaNu1yhe1caP5FqsdPY8W/pFXWDULhO0PbvQP4bZLHyzVG1lUVNy6xCgdx8+FXmF2PfXCX7hsXFU2S2ZlZVgOl360fVQ69451A2RgOtu2bW/O6odODMBPv91dZ+VjHizgerWfpmFuAYm2NXHpA86rgslxk47bw+VCFZCW5MFJPEBWhu7d8ag4nDsg7SlT391azpRsJs7YjDW3uYe7NxGRGZVBglWgQsEkd0RvBrPPK23UyM2VYMjXMHBj/l++rNFGVs6GpuPwoFu3dB9osgWOCBTmJ5ksdKhqOFXONDLZCKxHZl1G4iRqfAj4c6oSkVGGtsx7O8AmddI1nT1mvSWBxa3LFvEH2HtpcP7oZA5I5HWfKvNYY892nkd4rpe0ukmTYNhAYuXgcNHHJaYq5/kVR/zKtF4JizmuNv9Zce5r23ZhO+GYtr60xNKemyaGypPxG07t3KbjliiLbUneEWconjEmrfoQ5+fYf7zenVvPums4lafoDbJxYuAT1KXLpnQaLkj/v91XjlnLqa75WMRlsWrY+vcLHvCKfxdfSud4JPa/XOtj8p90ucM3DI5Hnk39+lZHBPpHCZ8yI/wijRjiSTOt6sXcAPn+G7w3++ki/pBGvhSboPDhr+veKbW5rrPLw8f1yojeAIfXx9X3ik3LxPAeetO3LB3gzRW7HOu5OGl0mRv3j46GuhdGMaL1kSZZOyeZH1WPiPeDWEe1pvq26F4w274Vj2X7Hn9U+MiPM1et7ZYF9RDfD/AGjeYvDl7bqDBIOU8jGh8q5xtmxFwkCA0MByBgxHOCK6la91YfpdhIzNHsMfNXg6ebAfwUeaymgGlfODJIKftrrTarUi2uk8qWQ6HmFCofWd9Co3EnUdsdTavC3Zy2tJusgMjWcumkaTHwrFX87l7zFnYyEZt8t9YDh2QfOK0uN2Libl26coBecrMwA7RMzEnd3cazO1XyEIsEJKkqWALfWgiN0Aa/ZqkRhlewIIB/e9+WrDbMhMPb1yi0H8Wd2LN7lHlTN5ZCseUieUnjx1X31YbbAFxU0+jtWlO/f1as2/vNGRVkj5PtnddjbaElQA7kgw2ikaHgZK1svlI2FcNnDpbBuZbpRRvJDyd2nIcawGy2Kk3FkHcCCQRxn0j1q8/wDFmKQ2WuubmW4txVYKD1a5lILRJLGdTMZJ41zrzLKLJ4jhlJefEYct1Zv4dTwV7iDcOIjN+UVCxdxzbzlmLG7qWYsxhB7RO+ttt3amBxYl8XetxJS11TMATwOWVbWdZG/hWMxYHVrGo6y7EiCQFtQSBPM8TTEaVJcoo+GRdm2OsZg0SoDgwBP0ttSDHc58wKeu/tAxMrGXyMgx376Ywt3KW71K+rKR8Kdw436TwP4/l51L0cWRv4KxcOacudYyqhMqmbIOC5zLesD0qbZin1QUGWiBO1opDhjTRsGtMLINKXBid1BlpGV9owZjqCOFb/5LtnZxiC2Yfs000JHaYiTOhIX0quTZ6kDTjW/+TzABbdw83j+VQf8AFQnTKHJerUKUsGf+VHDgW7WUfXEdw6thA7uyKweFQjh+ta7D0/2eHS3p9b8G/Osja2KOVEhFvDK6jUxjLDMndQgho8fA6H8DSMVhjBEcJH5etb3/AEGp3igdhiIImN3hRHAB7XAwGFYkTGtS0SeFbOx0cWdBVla6MLvAqm5pchI3Rl0Octb7j6VFtlkJUAhtGttuykEHz3fCutDoop4UD0NQ6xqKFO6IVNEXZeL620lz7QBI5HcwnuIIqPtnZy3RExmUp4ESynyGfzIrXbD6OKilI0mR57/f8asr/R5ChECd48QZX3gUVayGMildLhZn0/B52S0VJB3gkHxGhpV5oB8K7DtPoLba4WCjtdrdzqrv/J9bOmUUlPxGmPGTQ8pnJOvH2RQrqv8Aq8t8h76FB/5Gn9Rbyn2I20+ldpAUtEs+QAH6mbUFjzME/wCdYi8MxA3xJMn4/rjWnbY/09z5zbVXknKh7BzGRBWMw137986070i2JYs4SzeVcly9cYKoZyOrUEEw7Ek5svHjWlFos4vqZ7Z+H627btnQSFP3fbafLNUHaG1DcxF24RKu7EA7wu5B5AAVabImbzDhZvH/ALY07+1S+iexvnmISyBoxlzyQe23dpu7yOdGylyyuG+h0jovsPCJhrJu2A9x7aXXNzKdLgZx2YO5VYcNUjjNc321c67E3biqMuZsqjQKoIVNOUAV3TbZFrDXmUkBLVwgcB2SeAnfXDNmXbaOetViCFIyhG1V9VZWZeyVzbjO7vqdLLc3ItYscEl+jt8taLJIuj6KICvlWY8Yg6jWe+artp2SoRY0AaeYJuPv78oStDtvpKr9W+FsG01ps0wgHHRUWYHs8TooFUbslwtBzHQayCcoCyQeJiafr3dWDaXoVVu3LCN/CpZUhciCSYzGYA13TSRbC6+Xx0pI7WrHKvqx7kHCmEinQjlIYjvPxqTbFIVATI46irHC4JmV3XdbClvBmyz6ketdJoWnIRbWpdq3SbNmYA41Pt4RuQ9R+dAnKIrNirVqRXQOhlmLEj7bH3AfhWHtW4MGugdFFiwnfm9c7fgR6UjqJLadpn/U+gOllibank4Hqr/lWbSzrWv6R/sD95P8VZ3CKCyg7iQD60Gufug9e35i+Q5btabqULQOk68I4edPuuWRwkgbt1Wey9ldZAOk6nuHfVnNdTP9+UtsSv2bhlLgPu3GPdVxawAViDu4HWI5+NWF7ZVtR2OyRvJOh8eVKwzcDrSNt2eUa+n0rgts+o3hMMDEiKdFkTToUcKMRSNlqNONXArDWhO6pq21HAelRbZ1qeKFVJNMlwwV1+2OW4ke/Sgmz5BnSpy2xJP63U3dzeXE/hWVdVFScp8jECt6leVCpXzbuPoPzoqS2T/SFyjjjXLl6+xeC7MFgeyI7KKOP461XdP8aHxXVDVMMosrylRLnxzafwirzYCi27Yi5qLKPfbQ9ogdiOZLFYrBYhmYs7e0zSecsSx+Fe/rjyLzfoT9kpFnEHmiWgfv3ASO/RK6b8l+wxYw/XsO3e1HdaB7AHiZbwy8qxnRjZRv27Vkf7687k8rdlURm9XYDvIrsiIFUKogAAADcABAHpQdTP8AxReuPqZ/p/i+rwN7m8Wx/GwB901xe2oJYH7J+Mg766J8q+O1s4cHdN1v6V+Jrm9ojNu7vTnNPaGvFee4O15kTMNbhD4VAX25A14xVwq9g1n7za/hWjBZBS4wWWIYKJjfP4RHfqfSoqM7HTSN54Adw4+dO2bmdVkooEgluciIA1OnKpxthMq9Xcct7GYMoY/uomrfzeVS3jgHORBuKJESRESeJ3k++td8neHW5dvWn9m5YZT/ADoJHfrNUV8Hdct21OsBWOdTGkjMdNwIOvhWl+T0n5z4WXXhuzpG4UvdLMGKp++jPvYa27I3tIxU+KmD7xUhLrc/hVp0uwuXFuR9fK/qIPvBqstoaWlNtZFLfdbQ9aOutdE6P2z83tkb49QWJ9daweFwrMrsBogDHzdUA/7vdXQ+jx+htjkq+8UldN4L6T438hPSDWwe4qffH41nbDBdTqeXfwrS9IoFkxxK/wBQP4VllTjWdbqZ1p4B63+4vl+WSlLOxYxr8Kv9kbSNsFW1B4/WH51SWRFS0IrNn4pZ0eBrR6OKlvzyXeK2gGMKez8TR2cSN9VEURMA+Vctc38RvU6aHcvfngmJqxwZVkDaaz+VYG+5mr/DYoW7aLm3DXXjx99Frvrs9R2WjSS2s09oJyFOXrg3VlDtdQQTdHeDHnT2K2hKyDOUGe9d5/XdTSq3VNRM3UQlTNblwzRWrsedOs1ZTAbVDQA0jh9oTrodzDUad9W2HxupRjrvB4MDuIpKKaWGdwy1zUKhdd30VX5LbTj+3biW8BcQXrb3L1xM3V3Ef6NCXJlN0vpWGRogcpY+J/yHvpd6/MAdw89/5UvZmG625bt/bcDvyzLH+UMfKvSwaSASeWdj6AbO6vDoSIbIo14FputHncE/dFag6mo2zbeW0ukaSe6dY98U71gUFmMCs1y3SbGUsI4709xefaFwcFyJ6CT/AFCs4SAcywZ4668YOlSekd3+1XiQJ61zryDHXluANV9oq2kiTz3k8CDzr0FOFFL/AEJt5ZcWrgKA85qgxqQ5FWBsOizmBHDsgHxnwo79hmA0ndqOZE893v8AGjxkkVm+C++Te0ue6SgZlClSQCVnNMTumBUjphedLwymCVZToNxInU7twproLbKG60EkG2mURJJznjpAy1I6bpmuqREgGZMbhJgnQ+VKSmnqOf5wWk37N/O5m7SHjWv+T9f7Qx/9Nv6krJ2zWu6At/aG/wDbb+pKvbLMWZdf9xFh04w/btXOasp/hII/qNZxFrYdMlmyrfZcehBHxisgj0tHmIHVrFjNB0cUG1ikJAzWpExvWSB6x6Vp9iqerUH7K/0j/KsfsrHqiXVOXtLpp2id0Azpvq86P7bUgW3MMNFJ3MOAPf8AGlbYZyW09kVhPt+S46QfsTzkfEVnbBrQ7WJNpgdIBPorRr4xWcwzUpOhTTB61N2Jos7CTUpbA5Uxh7oqfacGsHU6Dng0dJdjqNCwKbvWNPfVpcskRIiZpDJWbZVOtNYNqq5FJ81mo17CePqa0hsCmbmGo9OIpZG43mRtbN624EMwTB1bcNT5wKdxPRk2zNjEPa/dPaG/SASK1+BwAUFyNToNDu/zPwFKv4RTGkwZ58CPgTW5pcKHIO7Ub3j0/f7nMV2i+DvZLzgqe0HA05EFQN3wOo3mdhs3aNu8AGbMpPZae3bYiYzDmIIbiN/enpL0ct4lMjaEaq0ag/lWD2RYbDXjh7sCTlVjrbmZC3BxtkmQd6kyN5olsIp59GRVRG2PHVHUfmLf8U3otCqD5ld/4Uf/AC7tCh+TDt9zvZn3+3/pC2h0aw2IQ9hFYyQ6ABgeem/zqk6DdFrtrFN14GnZQjUMp1dxy7Iy6/bNTOkK4q1cW7hVDa/S25gsOazpO/XTz4XWzce1whx2HX6rCCOasPd+NN+a0sFZURk8o2rncKr+kF9Etdt8oJ38IVSzZtNRlB046DjUjBX865+cjnEGCPUGst0yvW2vLbusWUKg6saF2u3DlClVLTNjhwJIBIFdBrOReWVwYHbmyMRiMXdWzYuXTKwwELlCLBLmFBjhzkVWYzo5ibPt4S8s6CBKyNSZWY8ONd72dYCW1ULlAExykkx76O9wptauSQJ1JnDMH0fx11exhbxE72lBw+2R+NWuG6D49suZFtjf2rsxxJhSeVdi4VA2jcK22I3gEjx4VSevnjg5aaLfJgOgmDe2+JN3er9WN5DFJErO8a0z05xGUIBoSWHkRrH641pBf4AczpzmTWQ+UFCbQY6ZWBkcm7PxIq0L901KQW3TuNLiigt3RVxsLabWXLIQCVI1APFTx8KxhxEcZ51MweMgyTPcB+tKbdsWY3s8k8o3+0ekT3bD23CmcvaGkQwO7yNUdu4TVU+0QdDu9JPIRQbaigQN1U3IpZROTyy6W/TgxFZddrDnT67UHOuyhZ6eRvNm7XuZSjOSmVpBg8CBBOo1I0FHaxY51irW0xzqbY2mKo4dgsVhJSRtLOMqfh8bHGsbh9pDnVhax450KVWQ0dpsLWNk76mJihzrI4bG1NTF0tPTLsMRsSNSt8UbOKzyX6k2754mkLtPHsHjqUi/faemiju1/wAqrcTiWbjHcABTKvSXas6+Vv6vwMV2x9EQsRh82/WqXH7LQ65a0hFRbloGllN9x6vU4M9kPIUKuvmw50dW3z7jHtK7sRi/aHiP6qqNo/tU+634UKFehsKVmj+T7/YU+/e/+56rMP8A+beY/pxVHQq1Xw/QQn1NxTNzhQoVaXQhDw3VWbY/Zt4GhQpefQLHqjMr7Y8G+FUXT3/Z2+8PilChR0Ht+F/I5gN5pXDyoUKMZQ6m8fdPxpOIoUKsjivO8+NOWqKhV0DZLtVPsUKFEiLzLLD1a4ahQq7FvUtcHv8AKrGxQoUGQRE21wqXZoUKSvJXUmLRUKFYOp6j1QGqM9ChSxo1DNChQqwyf//Z'),
        
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(artistName, style: Theme.of(context).textTheme.headlineLarge),
            Text(genre, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ],
    );
  }
}

class _AlbumListItem extends StatelessWidget {
  final Album album;

  const _AlbumListItem({required this.album});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: 120,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              album.imageUrl,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Expanded( // Added Expanded to allow text to take up remaining space
            child: Text(
              album.name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12),
            ),
          ),
        ],
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
      title: Text(award, style: Theme.of(context).textTheme.bodyMedium),
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
    return Text(
      'Ouvintes mensais: ${NumberFormat.compact().format(fansCount)}',
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

class Album {
  final String name;
  final String imageUrl;

  const Album({required this.name, required this.imageUrl});
}
