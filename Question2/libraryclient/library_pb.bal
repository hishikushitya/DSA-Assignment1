import ballerina/grpc;
import ballerina/protobuf;

public const string LIBRARY_DESC = "0A0D6C6962726172792E70726F746F12076C696272617279229A010A04426F6F6B12140A057469746C6518012001280952057469746C6512190A08617574686F725F311802200128095207617574686F723112190A08617574686F725F321803200128095207617574686F7232121A0A086C6F636174696F6E18042001280952086C6F636174696F6E12120A046973626E18052001280952046973626E12160A067374617475731806200128085206737461747573223C0A045573657212170A07757365725F69641801200128055206757365724964121B0A09757365725F7479706518022001280952087573657254797065221E0A08426F6F6B4953424E12120A046973626E18012001280952046973626E222F0A08426F6F6B4C69737412230A05626F6F6B7318012003280B320D2E6C6962726172792E426F6F6B5205626F6F6B7322070A05456D707479222A0A0C426F6F6B4C6F636174696F6E121A0A086C6F636174696F6E18012001280952086C6F636174696F6E223C0A0D426F72726F775265717565737412170A07757365725F6964180120012805520675736572496412120A046973626E18022001280952046973626E22240A08526573706F6E736512180A076D65737361676518012001280952076D65737361676532FA020A0E4C69627261727953657276696365122B0A07416464426F6F6B120D2E6C6962726172792E426F6F6B1A112E6C6962726172792E426F6F6B4953424E12310A0B4372656174655573657273120D2E6C6962726172792E557365721A112E6C6962726172792E526573706F6E73652801122A0A0A557064617465426F6F6B120D2E6C6962726172792E426F6F6B1A0D2E6C6962726172792E426F6F6B12320A0A52656D6F7665426F6F6B12112E6C6962726172792E426F6F6B4953424E1A112E6C6962726172792E426F6F6B4C69737412370A124C697374417661696C61626C65426F6F6B73120E2E6C6962726172792E456D7074791A112E6C6962726172792E426F6F6B4C69737412360A0A4C6F63617465426F6F6B12112E6C6962726172792E426F6F6B4953424E1A152E6C6962726172792E426F6F6B4C6F636174696F6E12370A0A426F72726F77426F6F6B12162E6C6962726172792E426F72726F77526571756573741A112E6C6962726172792E526573706F6E7365620670726F746F33";

public isolated client class LibraryServiceClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, LIBRARY_DESC);
    }

    isolated remote function AddBook(Book|ContextBook req) returns BookISBN|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/AddBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BookISBN>result;
    }

    isolated remote function AddBookContext(Book|ContextBook req) returns ContextBookISBN|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/AddBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BookISBN>result, headers: respHeaders};
    }

    isolated remote function UpdateBook(Book|ContextBook req) returns Book|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/UpdateBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Book>result;
    }

    isolated remote function UpdateBookContext(Book|ContextBook req) returns ContextBook|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/UpdateBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Book>result, headers: respHeaders};
    }

    isolated remote function RemoveBook(BookISBN|ContextBookISBN req) returns BookList|grpc:Error {
        map<string|string[]> headers = {};
        BookISBN message;
        if req is ContextBookISBN {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/RemoveBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BookList>result;
    }

    isolated remote function RemoveBookContext(BookISBN|ContextBookISBN req) returns ContextBookList|grpc:Error {
        map<string|string[]> headers = {};
        BookISBN message;
        if req is ContextBookISBN {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/RemoveBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BookList>result, headers: respHeaders};
    }

    isolated remote function ListAvailableBooks(Empty|ContextEmpty req) returns BookList|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/ListAvailableBooks", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BookList>result;
    }

    isolated remote function ListAvailableBooksContext(Empty|ContextEmpty req) returns ContextBookList|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/ListAvailableBooks", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BookList>result, headers: respHeaders};
    }

    isolated remote function LocateBook(BookISBN|ContextBookISBN req) returns BookLocation|grpc:Error {
        map<string|string[]> headers = {};
        BookISBN message;
        if req is ContextBookISBN {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/LocateBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BookLocation>result;
    }

    isolated remote function LocateBookContext(BookISBN|ContextBookISBN req) returns ContextBookLocation|grpc:Error {
        map<string|string[]> headers = {};
        BookISBN message;
        if req is ContextBookISBN {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/LocateBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BookLocation>result, headers: respHeaders};
    }

    isolated remote function BorrowBook(BorrowRequest|ContextBorrowRequest req) returns Response|grpc:Error {
        map<string|string[]> headers = {};
        BorrowRequest message;
        if req is ContextBorrowRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/BorrowBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Response>result;
    }

    isolated remote function BorrowBookContext(BorrowRequest|ContextBorrowRequest req) returns ContextResponse|grpc:Error {
        map<string|string[]> headers = {};
        BorrowRequest message;
        if req is ContextBorrowRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/BorrowBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Response>result, headers: respHeaders};
    }

    isolated remote function CreateUsers() returns CreateUsersStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("library.LibraryService/CreateUsers");
        return new CreateUsersStreamingClient(sClient);
    }
}

public client class CreateUsersStreamingClient {
    private grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendUser(User message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextUser(ContextUser message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveResponse() returns Response|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <Response>payload;
        }
    }

    isolated remote function receiveContextResponse() returns ContextResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <Response>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public type ContextUserStream record {|
    stream<User, error?> content;
    map<string|string[]> headers;
|};

public type ContextResponse record {|
    Response content;
    map<string|string[]> headers;
|};

public type ContextEmpty record {|
    Empty content;
    map<string|string[]> headers;
|};

public type ContextUser record {|
    User content;
    map<string|string[]> headers;
|};

public type ContextBorrowRequest record {|
    BorrowRequest content;
    map<string|string[]> headers;
|};

public type ContextBookList record {|
    BookList content;
    map<string|string[]> headers;
|};

public type ContextBook record {|
    Book content;
    map<string|string[]> headers;
|};

public type ContextBookLocation record {|
    BookLocation content;
    map<string|string[]> headers;
|};

public type ContextBookISBN record {|
    BookISBN content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type Response record {|
    string message = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type Empty record {|
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type User record {|
    int user_id = 0;
    string user_type = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BorrowRequest record {|
    int user_id = 0;
    string isbn = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BookList record {|
    Book[] books = [];
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type Book record {|
    string title = "";
    string author_1 = "";
    string author_2 = "";
    string location = "";
    string isbn = "";
    boolean status = false;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BookLocation record {|
    string location = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BookISBN record {|
    string isbn = "";
|};

