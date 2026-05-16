import '../../../core/utils/app_assets.dart';
import 'movie_model.dart';

class AppData {
  static final List<MovieModel> movies = [
    MovieModel(
      imagePath: AppAssets.movie1917,
      title: '1917',
      year: '2019',
      rating: '8.3',
    ),
    MovieModel(
      imagePath: AppAssets.docStrange,
      title: 'Doctor Strange in the Multiverse of Madness',
      year: '2022',
      rating: '7.6',
      likes: '15',
      duration: '90',
      summary:
          'Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346',
      screenshots: [
        AppAssets.screenshot1,
        AppAssets.screenshot2,
        AppAssets.screenshot3,
      ],
      similarMovies: [
        MovieModel(
          imagePath: AppAssets.blackWidow2,
          title: 'Black Widow',
          year: '2021',
          rating: '6.7',
        ),
        MovieModel(
          imagePath: AppAssets.captain,
          title: 'Captain America',
          year: '2011',
          rating: '6.9',
        ),
        MovieModel(
          imagePath: AppAssets.avengers,
          title: 'Iron Man',
          year: '2008',
          rating: '7.9',
        ),
        MovieModel(
          imagePath: AppAssets.darkKnight,
          title: 'The Dark Knight',
          year: '2008',
          rating: '9.0',
        ),
      ],
      cast: [
        CastMember(
          name: 'Hayley Atwell',
          character: 'Captain Carter / The Scarlet Witch',
          imagePath: AppAssets.cast1,
        ),
        CastMember(
          name: 'Elizabeth Olsen',
          character: 'Wanda Maximoff / The Scarlet Witch',
          imagePath: AppAssets.cast2,
        ),
        CastMember(
          name: 'Rachel McAdams',
          character: 'Dr. Christine Palmer',
          imagePath: AppAssets.cast3,
        ),
        CastMember(
          name: 'Charlize Theron',
          character: 'Clea',
          imagePath: AppAssets.cast4,
        ),
      ],
      genres: ['Fantasy', 'Horror', 'Sci-Fi', 'Adventure'],
    ),
    MovieModel(
      imagePath: AppAssets.blackWidow,
      title: 'Black Widow',
      year: '2021',
      rating: '6.7',
    ),
    MovieModel(
      imagePath: AppAssets.captain,
      title: 'Captain America',
      year: '2011',
      rating: '6.9',
    ),
    MovieModel(
      imagePath: AppAssets.ironMan,
      title: 'Iron Man',
      year: '2008',
      rating: '7.9',
    ),
    MovieModel(
      imagePath: AppAssets.darkKnight,
      title: 'The Dark Knight',
      year: '2008',
      rating: '9.0',
    ),
  ];
}
