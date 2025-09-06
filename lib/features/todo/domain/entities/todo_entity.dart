/*

  This is the core business object used throughout my app.
  Here I define the essential properties like id, text, isComplete.

*/

class TodoEntity {
  final int id;
  final String text;
  final bool isComplete;

  TodoEntity({
    required this.id,
    required this.text,
    this.isComplete = false,  // inicialy todo is incompleate 
  });

  TodoEntity toggleCompletion() {
    return TodoEntity(
      id: id,
      text: text,
      isComplete: !isComplete,
    );
  }


}

