import ballerina/grpc;

listener grpc:Listener ep = new (9090);

@grpc:Descriptor {value: LIBRARY_DESC}
service "LibraryService" on ep {

    remote function AddBook(Book value) returns BookISBN|error {
        // Simulated logic to add a book to the library
        value.isbn = generateUniqueISBN();
        libraryDatabase[value.isbn] = value;
        return { isbn: value.isbn };
    }
    remote function UpdateBook(Book value) returns Book|error {
        // Simulated logic to update a book in the library
        if (libraryDatabase[value.isbn] is Book existingBook) {
            libraryDatabase[value.isbn] = value;
            return value;
        } else {
            return error("Book not found.");
        }
    }
    remote function RemoveBook(BookISBN value) returns BookList|error {
        // Simulated logic to remove a book from the library
        if (libraryDatabase.hasKey(value.isbn)) {
            libraryDatabase.remove(value.isbn);
        } else {
            return error("Book not found.");
        }
        // Return the list of remaining books
        Book[] remainingBooks = libraryDatabase.values().toArray();
        return { books: remainingBooks };
    }
    remote function ListAvailableBooks(Empty value) returns BookList|error {
         // Simulated logic to list available books in the library
        Book[] availableBooks = libraryDatabase.values().toArray();
        return { books: availableBooks };
    }
    remote function LocateBook(BookISBN value) returns BookLocation|error {
        // Simulated logic to locate a book in the library
        if (libraryDatabase.hasKey(value.isbn)) {
            return { location: "Shelf 3, Row 2" };
        } else {
            return error("Book not found.");
        }
    }
    remote function BorrowBook(BorrowRequest value) returns Response|error {
        // Simulated logic to borrow a book from the library
        if (libraryDatabase.hasKey(value.bookISBN.isbn) && userDatabase.hasKey(value.user.username)) {
            // Perform book borrowing and user registration logic here
            // Update due dates, record borrow history, etc.
            return { message: "Book borrowed successfully." };
        } else {
            return error("Book or user not found.");
        }
    }
    remote function CreateUsers(stream<User, grpc:Error?> clientStream) returns Response|error {
        // Simulated logic to create users
        while (true) {
            var result = <User, grpc:Error?> clientStream.getNext();
            if (result is User user) {
                userDatabase[user.username] = user;
            } else if (result is grpc:Error) {
                // Handle error
            } else {
                break;
            }
        }
        return { message: "Users created successfully." };
    }
}

function generateUniqueISBN() returns string {
    // Simulated logic to generate a unique ISBN
    int randomInt = math:randInt(1000, 9999);
    return "ISBN-" + string(randomInt);
}

    

