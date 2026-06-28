import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'bloc/ai_chat/ai_chat_bloc.dart';
import 'bloc/editor/editor_bloc.dart';
import 'bloc/editor/editor_event.dart';
import 'core/database/app_database.dart';
import 'core/services/export_service.dart';
import 'ui/editor/editor_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Drift database
  final db = AppDatabase();
  
  // Initialize Dio for networking
  final dio = Dio();
  
  // Initialize Export Service
  final exportService = ExportService(dio);

  runApp(MyApp(db: db, dio: dio, exportService: exportService));
}

class MyApp extends StatelessWidget {
  final AppDatabase db;
  final Dio dio;
  final ExportService exportService;

  const MyApp({
    super.key, 
    required this.db, 
    required this.dio,
    required this.exportService,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EditorBloc>(
          create: (context) {
            final bloc = EditorBloc(db.documentsDao, exportService);
            // Load a dummy document for now (ID: 1)
            // In a real app, you'd have a document list screen
            bloc.add(const EditorEvent.loadDocument(1));
            return bloc;
          },
        ),
        BlocProvider<AiChatBloc>(
          create: (context) => AiChatBloc(dio),
        ),
      ],
      child: MaterialApp(
        title: 'ScriptEase',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const EditorScreen(),
      ),
    );
  }
}
