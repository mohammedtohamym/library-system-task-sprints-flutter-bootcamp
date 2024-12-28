// Class representing a Book
class Book {
  late String id;  // Unique identifier for the book
  late String title;  // Title of the book
  bool isBorrowed = false;  // Whether the book is currently borrowed or not

  // Constructor for creating a Book instance with required parameters: id and title
  Book({required this.id, required this.title });

  // Method to display information about the book
  void displayInfo () {
    print('ID: $id');  // Print book ID
    print('Title: $title');  // Print book title
    print('Is Borrowed: ${isBorrowed? 'Yes' : 'No'}');  // Print borrowing status
  }
}

// Class representing a User
class User {
  late String id;  // Unique identifier for the user
  late String name;  // Name of the user

  // Constructor for creating a User instance with required parameters: id and name
  User({required this.id, required this.name });

  // Method to display information about the user
  void displayInfo() {
    print('ID: $id');  // Print user ID
    print('Name: $name');  // Print user name
  }
}

// Class representing a BorrowLog, which links a Book and a User
class BorrowLog {
  late Book book;  // The borrowed book
  late User user;  // The user who borrowed the book

  // Constructor to initialize BorrowLog with a book and a user
  BorrowLog({required this.book, required this.user});
}

// Main Library class to manage books, users, and borrowing logic
class Library {
  List<Book> books = [];  // List of books available in the library
  List<User> users = [];  // List of users registered in the library

  Map<User, Book> borrowLogs = {};  // Map to track which users borrowed which books

  int _bookIdCounter = 0;  // Counter for generating unique book IDs
  int _userIdCounter = 0;  // Counter for generating unique user IDs

  // Method to add a book to the library by title
  void addBook({required String title}) {
    Book book = Book(id: _bookIdCounter.toString(), title: title);  // Create a new book
    books.add(book);  // Add the book to the books list
    _bookIdCounter += 1;  // Increment the book ID counter for the next book
  }

  // Method to add a user to the library by name
  void addUser({required String name}) {
    User user = User(id: _userIdCounter.toString(), name: name);  // Create a new user
    users.add(user);  // Add the user to the users list
    _userIdCounter += 1;  // Increment the user ID counter for the next user
  }
  
  // Method to borrow a book
  void borrowBook({required String bookTitle, required String userName}) {
    
    bool bookExists = false;  // Flag to check if the book exists
    bool userExists = false;  // Flag to check if the user exists
    late int bookIndex;  // Variable to hold the index of the book
    late int userIndex;  // Variable to hold the index of the user

    // Find the book by title
    for(int i = 0; i < books.length; i++) {
      if (books[i].title.toLowerCase() == bookTitle.toLowerCase()) {
        bookExists = true;  // Book found
        bookIndex = i;  // Store book index
        break;
      }
    }

    // If the book doesn't exist, show a message and return
    if (bookExists == false) {
      print('This book does not exit in the library system, try adding it first!');
      return;
    }

    // Find the user by name
    for(int i = 0; i < users.length; i++) {
      if (users[i].name.toLowerCase() == userName.toLowerCase()) {
        userExists = true;  // User found
        userIndex = i;  // Store user index
        break;
      }
    }
    
    // If the user doesn't exist, show a message and return
    if (userExists == false) {
      print('This user does not exit in the library system, try adding them first!');
      return;
    }
    
    // If the book is already borrowed, show a message and return
    if (books[bookIndex].isBorrowed == true) {
      print('This book is already borrowed!');
      return;
    }

    // Record the borrowing in the borrowLogs map
    borrowLogs[users[userIndex]] = books[bookIndex];
    books[bookIndex].isBorrowed = true;  // Mark the book as borrowed
    print('${books[bookIndex].title} is now borrowed!');  // Inform the user
  }
  
  // Method to return a borrowed book
  void returnBook({required String bookTitle}) {
    
    bool bookExists = false;  // Flag to check if the book exists
    late int bookIndex;  // Variable to hold the index of the book

    // Find the book by title
    for(int i = 0; i < books.length; i++) {
      if (books[i].title.toLowerCase() == bookTitle.toLowerCase()) {
        bookExists = true;  // Book found
        bookIndex = i;  // Store book index
        break;
      }
    }

    // If the book doesn't exist, show a message and return
    if (bookExists == false) {
      print('This book does not exit in the library system, try adding it first!');
      return;
    }

    // If the book is not borrowed, show a message and return
    if (books[bookIndex].isBorrowed == false) {
      print('${books[bookIndex].title} is not borrowed!');
      return;
    }

    // Remove the borrowed book entry from borrowLogs
    borrowLogs.removeWhere((key, value) => value.title.toLowerCase() == bookTitle.toLowerCase());

    books[bookIndex].isBorrowed = false;  // Mark the book as returned
    print('${books[bookIndex].title} is returned!');  // Inform the user
    return;
  }

  // Method to display borrowing information
  void displayInfo() {
    if (borrowLogs.isNotEmpty) {
      borrowLogs.forEach((user, book) {
        print('${user.name} borrowed ${book.title}');  // Print each borrowed book info
      });
    } else {
      print('No logs');  // If there are no borrow logs, print this message
    }
  }
}
