// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
 * ReadVault - A simple smart contract to track ownership and borrow history
 * of books (digital or physical)
 */

contract ReadVault {

    // Book structure
    struct Book {
        uint256 id;
        string title;
        address owner;
        address currentBorrower;
        address[] borrowHistory;
    }

    // Mapping from book ID to Book details
    mapping(uint256 => Book) public books;

    // Event declarations (to show activity on blockchain)
    event BookRegistered(uint256 bookId, string title, address indexed owner);
    event BookBorrowed(uint256 bookId, address indexed borrower);
    event BookReturned(uint256 bookId, address indexed borrower);

    // Register a new book
    function registerBook(uint256 _bookId, string memory _title) public {
        require(books[_bookId].id == 0, "Book already registered!");

        books[_bookId].id = _bookId;
        books[_bookId].title = _title;
        books[_bookId].owner = msg.sender;

        emit BookRegistered(_bookId, _title, msg.sender);
    }

    // Borrow a book
    function borrowBook(uint256 _bookId) public {
        Book storage book = books[_bookId];
        require(book.id != 0, "Book not found!");
        require(book.currentBorrower == address(0), "Book already borrowed!");
        require(msg.sender != book.owner, "Owner cannot borrow their own book!");

        book.currentBorrower = msg.sender;
        book.borrowHistory.push(msg.sender);

        emit BookBorrowed(_bookId, msg.sender);
    }

    // Return a book
    function returnBook(uint256 _bookId) public {
        Book storage book = books[_bookId];
        require(book.id != 0, "Book not found!");
        require(book.currentBorrower == msg.sender, "You are not the borrower!");

        book.currentBorrower = address(0);

        emit BookReturned(_bookId, msg.sender);
    }

    // Get borrow history
    function getBorrowHistory(uint256 _bookId) public view returns (address[] memory) {
        require(books[_bookId].id != 0, "Book not found!");
        return books[_bookId].borrowHistory;
    }

    // Check current borrower
    function getCurrentBorrower(uint256 _bookId) public view returns (address) {
        require(books[_bookId].id != 0, "Book not found!");
        return books[_bookId].currentBorrower;
    }
}
