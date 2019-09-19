class MyAnnotation {
  final String notes;
  const MyAnnotation(this.notes);
}

@MyAnnotation("This is my function")
void myFunction(){
  print("My Function");
}

void main(){
  myFunction();
}