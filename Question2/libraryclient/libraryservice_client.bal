import ballerina/io;
import ballerina/grpc;

LibraryServiceClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    // Add a book to the library
    Book addBookRequest = { title: "Ballerina Book", author: "Author Name", isbn: "" };
    BookISBN addBookResponse = check ep->AddBook(addBookRequest);
    io:println("Added Book ISBN: " + addBookResponse.isbn);

    // Update a book in the library
    Book updateBookRequest = { title: "Updated Book Title", author: "Updated Author", isbn: "" };
    Book updateBookResponse = check ep->UpdateBook(updateBookRequest);
    io:println("Updated Book: " + updateBookResponse);

    // Remove a book from the library
    BookISBN removeBookRequest = { isbn: updateBookResponse.isbn };
    BookList removeBookResponse = check ep->RemoveBook(removeBookRequest);
    io:println("Removed Book: " + removeBookResponse);

    // List available books in the library
    Empty listAvailableBooksRequest = {};
    BookList listAvailableBooksResponse = check ep->ListAvailableBooks(listAvailableBooksRequest);
    io:println("Available Books: " + listAvailableBooksResponse.books);

    // Locate a book in the library
    BookISBN locateBookRequest = { isbn: addBookResponse.isbn };
    BookLocation locateBookResponse = check ep->LocateBook(locateBookRequest);
    io:println("Book Location: " + locateBookResponse.location);

    // Borrow a book from the library
    User user = { username: "user1", email: "user1@example.com" };
    BorrowRequest borrowBookRequest = { user: user, bookISBN: { isbn: addBookResponse.isbn }, dueDate: "2023-09-30" };
    Response borrowBookResponse = check ep->BorrowBook(borrowBookRequest);
    io:println(borrowBookResponse);

    // Create users
    User createUserRequest = { username: "user1", email: "user1@example.com" };
    CreateUsersStreamingClient createUsersStreamingClient = check ep->CreateUsers();
    check createUsersStreamingClient->sendUser(createUserRequest);
    check createUsersStreamingClient->complete();
    Response? createUsersResponse;
    while (true) {
        var result = createUsersStreamingClient->receiveResponse();
        if (result is Response) {
            createUsersResponse = result;
            break;
        }
    }
    io:println(createUsersResponse);

    return ();
}
