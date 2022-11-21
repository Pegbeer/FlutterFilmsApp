import 'package:films_application/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'No Movie';

    return Scaffold(
      body: CustomScrollView(slivers: [
        const _CustomAppBar(),
        SliverList(
            delegate: SliverChildListDelegate(const [
          _PosterAndTitle(),
          _Overview(),
          _Overview(),
          _Overview(),
          _Overview(),
          _Overview(),
          _Overview(),
          _Overview(),
          _Overview(),
          CastingCard()
        ]))
      ]),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
            color: Colors.black12,
            width: double.infinity,
            child: const Text(
              'movie.title',
              textAlign: TextAlign.center,
            )),
        background: const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: AssetImage('assets/loading.gif'),
            fit: BoxFit.cover),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'),
            image: AssetImage('assets/no-image.jpg'),
            height: 200,
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('movie.title',
                style: theme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2),
            Text('Original title',
                style: theme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 1),
            Row(
              children: [
                const Icon(Icons.star_outline, size: 24),
                const SizedBox(width: 5),
                Text('movie.voteAverage', style: theme.bodyMedium)
              ],
            )
          ],
        )
      ]),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Amet adipisicing pariatur aliquip culpa velit ad cillum duis tempor do sint commodo. Amet adipisicing pariatur aliquip culpa velit ad cillum duis tempor do sint commodo. Amet adipisicing pariatur aliquip culpa velit ad cillum duis tempor do sint commodo.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
