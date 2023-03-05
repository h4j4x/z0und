import 'package:flutter/material.dart';

import '../handler/music_source_handler.dart';
import '../model/music_source.dart';
import '../service/data.dart';
import '../widget/message_options.dart';
import 'login.dart';

class MusicListPage extends StatefulWidget {
  const MusicListPage({super.key});

  @override
  State<MusicListPage> createState() => _MusicListPageState();
}

class _MusicListPageState extends State<MusicListPage> {
  int? enabledHandlersCount;
  bool loading = false;
  final musicSources = <MusicSource>[];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      int handlersCount = await MusicSourceHandler.countEnabledHandlers();
      setState(() {
        enabledHandlersCount = handlersCount;
      });
      loadMusicSources();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MUSIC TODO'),
        actions: [
          IconButton(
            onPressed: !loading ? scanMusicSources : null,
            icon: const Icon(Icons.manage_search_sharp),
          ),
          IconButton(
            onPressed: !loading ? loadMusicSources : null,
            icon: const Icon(Icons.refresh_sharp),
          ),
        ],
      ),
      body: enabledHandlersCount == null || loading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : body(),
    );
  }

  Widget body() {
    if (enabledHandlersCount == 0) {
      return MessageOptionsWidget(
        message: 'NO SOURCES TODO',
        options: [
          ListTile(
            title: const Text('LOGIN TODO'),
            trailing: const Icon(Icons.arrow_forward_sharp),
            onTap: () {
              LoginPage.pushRouteTo(context);
            },
          ),
        ],
      );
    }
    if (musicSources.isEmpty) {
      return MessageOptionsWidget(
        message: 'NO MUSIC YET TODO',
        options: [
          ListTile(
            title: const Text('SCAN TODO'),
            trailing: const Icon(Icons.manage_search_sharp),
            onTap: !loading ? scanMusicSources : null,
          ),
          ListTile(
            title: const Text('RELOAD TODO'),
            trailing: const Icon(Icons.refresh_sharp),
            onTap: !loading ? loadMusicSources : null,
          ),
          ListTile(
            title: const Text('ADD LOGIN TODO'),
            trailing: const Icon(Icons.arrow_forward_sharp),
            onTap: () {
              LoginPage.pushRouteTo(context);
            },
          ),
        ],
      );
    }
    return Container(); // todo: list
  }

  void loadMusicSources() async {
    if (enabledHandlersCount == 0 || loading) {
      return;
    }
    setState(() {
      loading = true;
    });
    final sources = await DataService().allMusicSources();
    musicSources.clear();
    musicSources.addAll(sources);
    setState(() {
      loading = false;
    });
  }

  void scanMusicSources() async {
    if (enabledHandlersCount == 0 || loading) {
      return;
    }
    setState(() {
      loading = true;
    });
    final sources = await DataService().scanMusicSources();
    musicSources.clear();
    musicSources.addAll(sources);
    setState(() {
      loading = false;
    });
  }
}
