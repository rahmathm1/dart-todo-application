import 'dart:html';

import 'dart:convert' show JSON;

UListElement todoList;


void main() {
  querySelector('#btn-add').onClick.listen(addToList);
  querySelector('#btn-clear').onClick.listen(clearList);
  todoList = querySelector('#todo-list');
  var todos = getTodoFromStorage();
  for(var todo in  todos) {
    LIElement li = new LIElement();
    li.setInnerHtml(todo);
    todoList.append(li);
  }
}
void updateStorage(String todo) {
  List todos = new List();
  String a = window.localStorage['todos'];
  if(a != null)
    todos = JSON.decode(a);
  todos.add(todo); 
  window.localStorage['todos'] = JSON.encode(todos ); 
  
}
void addToList(Event e) {
  InputElement input = querySelector('#todo-text');
  String todo = input.value;
  updateStorage(todo);
  LIElement li = new LIElement();
  li.setInnerHtml(todo);
  todoList.append(li);
  input.value = "";
}
void clearList(Event e) {
  window.localStorage.clear();
  todoList.children.clear();
}

List getTodoFromStorage() {
  List todos = new List();
  if(window.localStorage['todos'] != null)
    todos = JSON.decode(window.localStorage['todos']);
  return todos;
}
