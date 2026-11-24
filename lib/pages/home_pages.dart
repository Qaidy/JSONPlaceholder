import 'package:flutter/material.dart';
import 'package:jsonplaceholder/pages/tabs/posts_tab.dart';
import 'package:jsonplaceholder/pages/tabs/comments_tab.dart';
import 'package:jsonplaceholder/pages/tabs/albums_tab.dart';
import 'package:jsonplaceholder/pages/tabs/users_tab.dart';
import 'package:jsonplaceholder/pages/tabs/photos_tab.dart';
import 'package:jsonplaceholder/pages/tabs/todos_tab.dart';
import 'package:jsonplaceholder/service/api_service.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  int? _postsCount;
  int? _commentsCount;
  int? _albumsCount;
  int? _usersCount;
  int? _photosCount;
  int? _todosCount;

  @override
  void initState() {
    super.initState();
    _loadInitialCounts();
  }

  void _loadInitialCounts() async {
    try {
      final posts = await ApiService.fetchPosts();
      if (mounted) {
        setState(() {
          _postsCount = posts.length;
        });
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 840;

        return DefaultTabController(
          length: 6,
          child: Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: const Color(0x1A4A3B7C),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.hub_outlined,
                      color: Color(0xFF4A3B7C),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'JSONPlaceholder API',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(64),
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0x0F000000),
                        width: 1,
                      ),
                    ),
                  ),
                  child: TabBar(
                    isScrollable: true,
                    tabAlignment: isDesktop ? TabAlignment.center : TabAlignment.start,
                    labelColor: const Color(0xFF4A3B7C),
                    unselectedLabelColor: Colors.grey[600],
                    indicatorColor: const Color(0xFF4A3B7C),
                    indicatorWeight: 3,
                    tabs: [
                      Tab(
                        icon: const Icon(Icons.article_outlined),
                        text: _postsCount != null ? 'Posts ($_postsCount)' : 'Posts',
                      ),
                      Tab(
                        icon: const Icon(Icons.comment_outlined),
                        text: _commentsCount != null
                            ? 'Comments ($_commentsCount)'
                            : 'Comments',
                      ),
                      Tab(
                        icon: const Icon(Icons.photo_album_outlined),
                        text: _albumsCount != null
                            ? 'Albums ($_albumsCount)'
                            : 'Albums',
                      ),
                      Tab(
                        icon: const Icon(Icons.person_outline),
                        text: _usersCount != null ? 'Users ($_usersCount)' : 'Users',
                      ),
                      Tab(
                        icon: const Icon(Icons.photo_outlined),
                        text: _photosCount != null
                            ? 'Photos ($_photosCount)'
                            : 'Photos',
                      ),
                      Tab(
                        icon: const Icon(Icons.check_box_outlined),
                        text: _todosCount != null ? 'Todos ($_todosCount)' : 'Todos',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: [
                PostsTab(
                  onCountLoaded: (count) {
                    if (mounted && _postsCount != count) {
                      setState(() => _postsCount = count);
                    }
                  },
                ),
                CommentsTab(
                  onCountLoaded: (count) {
                    if (mounted && _commentsCount != count) {
                      setState(() => _commentsCount = count);
                    }
                  },
                ),
                AlbumsTab(
                  onCountLoaded: (count) {
                    if (mounted && _albumsCount != count) {
                      setState(() => _albumsCount = count);
                    }
                  },
                ),
                UsersTab(
                  onCountLoaded: (count) {
                    if (mounted && _usersCount != count) {
                      setState(() => _usersCount = count);
                    }
                  },
                ),
                PhotosTab(
                  onCountLoaded: (count) {
                    if (mounted && _photosCount != count) {
                      setState(() => _photosCount = count);
                    }
                  },
                ),
                TodosTab(
                  onCountLoaded: (count) {
                    if (mounted && _todosCount != count) {
                      setState(() => _todosCount = count);
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
