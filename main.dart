import 'Library_system.dart';  // Importing the Library system class

void main() {
  //Using some test data
  
  // Create a new Library instance
  Library library = Library();

  // Add a user named 'user1'
  library.addUser(name: 'user1');

  // Add a book titled 'book1'
  library.addBook(title: 'book1');

  // Borrow the book 'book1' for user 'user1'
  library.borrowBook(bookTitle: 'book1', userName: 'user1');
  // Display current borrowing logs
  library.displayInfo();
  print('______________________________');

  // Try to borrow a book that doesn't exist ('book2') for user 'user1'
  library.borrowBook(bookTitle: '2', userName: 'user1');
  library.displayInfo();
  print('______________________________');

  // Try to borrow a book 'book1' for a non-existent user 'u'
  library.borrowBook(bookTitle: 'book1', userName: 'u');
  library.displayInfo();
  print('______________________________');

  // Try to borrow the same book again ('book1') for user 'user1'
  library.borrowBook(bookTitle: 'book1', userName: 'user1');
  library.displayInfo();
  print('______________________________');

  // Try to return a non-existent book 'bookbook'
  library.returnBook(bookTitle: 'bookbook');
  library.displayInfo();
  print('______________________________');

  // Successfully return the book 'book1'
  library.returnBook(bookTitle: 'book1');
  library.displayInfo();
  print('______________________________');

  // Try to borrow 'book1' again for 'user1'
  library.borrowBook(bookTitle: 'book1', userName: 'user1');
  library.displayInfo();
  print('______________________________');

  // Add more books and users to the system
  library.addBook(title: 'book2');
  library.addBook(title: 'book3');
  library.addUser(name: 'user2');
  library.addUser(name: 'user3');
  library.displayInfo();
  print('______________________________');

  // User 'user2' borrows 'book3'
  library.borrowBook(bookTitle: 'book3', userName: 'user2');
  library.displayInfo();
  print('______________________________');

  // User 'user3' tries to borrow 'book3' (which is already borrowed by 'user2')
  library.borrowBook(bookTitle: 'book3', userName: 'user3');
  library.displayInfo();
  print('______________________________');

  // Return the book 'book2' and display borrowing info
  library.returnBook(bookTitle: 'book2');
  library.displayInfo();
  print('______________________________');

  // Return 'book3' (which was borrowed by 'user2') and display borrowing info
  library.returnBook(bookTitle: 'book3');
  library.displayInfo();
}
