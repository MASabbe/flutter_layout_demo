import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  /// Builds the top-level widget that contains the app's overall layout.
  ///
  /// The layout is a [MaterialApp] with a [Scaffold] body, which contains a
  /// [Column] of children inside a [SingleChildScrollView]. The children are
  /// a [ImageSection], a [TitleSection], a [ButtonSection], and a [TextSection].
  ///
  /// The [ImageSection] displays an image of a lake, and the [TitleSection]
  /// displays a title and location. The [ButtonSection] displays a row of
  /// buttons, and the [TextSection] displays a block of text.
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(title: const Text(appTitle)),
        // #docregion add-widget
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ImageSection(image: 'images/lake.jpg'),
              TitleSection(
                name: 'Oeschinen Lake Campground',
                location: 'Kandersteg, Switzerland',
              ),
              ButtonSection(),
              TextSection(
                description:
                'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                    'Bernese Alps. Situated 1,578 meters above sea level, it '
                    'is one of the larger Alpine Lakes. A gondola ride from '
                    'Kandersteg, followed by a half-hour walk through pastures '
                    'and pine forest, leads you to the lake, which warms to 20 '
                    'degrees Celsius in the summer. Activities enjoyed here '
                    'include rowing, and riding the summer toboggan run.',
              ),
            ],
          ),
        ),
        // #enddocregion add-widget
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  /// Builds a row containing the name and location of the lake.
  ///
  /// The row has a bold title, a smaller location, and a star rating
  /// at the right side.
  ///
  /// The widget is padded by 32 pixels on all sides. The title and
  /// location are aligned to the left, and the star rating is aligned
  /// to the right.
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(location, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          /*3*/
          // #docregion icon
          Icon(Icons.star, color: Colors.red[500]),
          // #enddocregion icon
          const Text('41'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  /// Builds a row of three buttons with the given color.
  ///
  /// The buttons are labeled [label] and have the given [icon].
  ///
  /// The row is sized to fit its children and is centered horizontally.
  /// The buttons are distributed evenly horizontally.
  ///
  /// The [color] parameter is not optional and must be set.
  ///
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(color: color, icon: Icons.call, label: 'CALL'),
          ButtonWithText(color: color, icon: Icons.near_me, label: 'ROUTE'),
          ButtonWithText(color: color, icon: Icons.share, label: 'SHARE'),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  /// Builds a column with an [Icon] and a [Text] below it.
  ///
  /// The [Icon] is built with the given [icon] and [color].
  ///
  /// The [Text] is built with the given [label], and the following style:
  ///
  /// * The font size is 12.
  /// * The font weight is [FontWeight.w400].
  /// * The color is the given [color].
  ///
  /// The [Icon] and [Text] are both centered horizontally.
  ///
  /// The column is sized to fit its children and is centered horizontally.
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  /// Builds a padded [Text] with the given [description].
  ///
  /// The [Text] is padded by 32 pixels on all sides.
  ///
  /// The [Text] soft wraps its content.
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true),
    );
  }
}

// #docregion image-asset
class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  /// Builds an [Image] widget with the provided [image] asset.
  ///
  /// The [Image] is displayed with a width of 600 pixels and a height of 240 pixels.
  /// The image is fitted to cover the space using [BoxFit.cover].
  ///
  /// Returns a widget that displays the image asset.
  Widget build(BuildContext context) {
    // #docregion image-asset
    return Image.asset(image, width: 600, height: 240, fit: BoxFit.cover);
    // #enddocregion image-asset
  }
}
// #enddocregion image-section

// #docregion favorite-widget
class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}
// #enddocregion favorite-widget

// #docregion favorite-state, favorite-state-fields, favorite-state-build
class _FavoriteWidgetState extends State<FavoriteWidget> {
  // #enddocregion favorite-state-build
  bool _isFavorited = true;
  int _favoriteCount = 41;
  // #enddocregion favorite-state-fields

  // #docregion toggle-favorite
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
  // #enddocregion toggle-favorite

  // #docregion favorite-state-build
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            icon:
            (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(width: 18, child: SizedBox(child: Text('$_favoriteCount'))),
      ],
    );
  }

// #docregion favorite-state-fields
}

// #enddocregion favorite-state, favorite-state-fields, favorite-state-build