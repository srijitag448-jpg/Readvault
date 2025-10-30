// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
 * ReadVault Smart Contract
 * Tracks ownership and borrowing history of digital or physical books
 */

contract ReadVault {
    // Struct to store book details
    struct Book {
        uint256 id;
        string title;
        address owner;
        address currentBorrower;
        address[] borrowHistory;
    }

    // Mapping from book ID to Book data
    mapping(uint256 => Book) public books;

    // Event logs for transparency
    event BookRegistered(uint256 bookId, string title, address owner);
    event BookBorrowed(uint256 bookId, address borrower);
    event BookReturned(uint256 bookId, address borrower);

    // Function to register a new book
    function registerBook(uint256 _id, string memory _title) public {
        require(books[_id].id == 0, "Book already registered!");

        // Create a new book
        books[_id] = Book({
            id: _id,
            title: _title,
            owner: msg.sender,
            currentBorrower: address(0),
            borrowHistory: new address 
        });

        emit BookRegistered(_id, _title, msg.sender);
    }

    // Function to borrow a book
    function borrowBook(uint256 _id) public {
        Book storage book = books[_id];
        require(book.id != 0, "Book not found!");
        require(book.currentBorrower == address(0), "Book already borrowed!");
        require(msg.sender != book.owner, "Owner can't borrow their own book!");

        book.currentBorrower = msg.sender;
        book.borrowHistory.push(msg.sender);

        emit BookBorrowed(_id, msg.sender);
    }

    // Function to return a borrowed book
    function returnBook(uint256 _id) public {
        Book storage book = books[_id];
        require(book.id != 0, "Book not found!");
        require(book.currentBorrower == msg.sender, "You're not the borrower!");

        book.currentBorrower = address(0);

        emit BookReturned(_id, msg.sender);
    }

    // Function to view borrow history
    function getBorrowHistory(uint256 _id) public view returns (address[] memory) {
        require(books[_id].id != 0, "Book not found!");
        return books[_id].borrowHistory;
    }
}

