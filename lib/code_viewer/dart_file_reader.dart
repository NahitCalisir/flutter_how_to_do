import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:code_editor/code_editor.dart';
import 'package:flutter/services.dart';

class DartFileReader extends StatefulWidget {
  String title = "";
  String filePath = "";

  DartFileReader({required this.title, required this.filePath});

  @override
  _DartFileReaderState createState() => _DartFileReaderState();
}

class _DartFileReaderState extends State<DartFileReader> {
  String fileContent = '';

  @override
  void initState() {
    super.initState();
    loadDartFile();
  }

  Future<void> loadDartFile() async {
    try {
      String contents = await rootBundle.loadString(widget.filePath);
      setState(() {
        fileContent = contents;
      });
    } catch (e) {
      print('Hata oluştu: $e');
    }
  }

  void shareCode() {
    Clipboard.setData(ClipboardData(text: fileContent));
    // Kullanıcıya geri bildirim vermek için snackbar gösterebilirsiniz
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Code copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var appBarHeight = AppBar().preferredSize.height;
    var safeAreaHeight = MediaQuery.of(context).padding.vertical;

    return Scaffold(
      appBar: AppBar(
        title: Text('.Code Structure'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              shareCode();
            },
          ),
        ],
      ),
      body: Center(
        child: fileContent.isEmpty
            ? Text("File does not exist.")
            : CodeEditor(
          model: EditorModel(
            files: [
              FileEditor(
                name: "${widget.title}.dart",
                language: "dart",
                code: fileContent,
              ),
            ],
            styleOptions: EditorModelStyleOptions(
              fontSize: 14,
              fontFamily: 'monospace',
              lineHeight: 1.4,
              heightOfContainer: screenHeight - appBarHeight - safeAreaHeight - 60,
            ),
          ),
        ),
      ),
    );
  }
}
