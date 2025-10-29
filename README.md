# Readvault
Track ownership and borrow history of digital or physical book
# 📚 ReadVault – Decentralized Book Ownership & Borrow History Tracker

<img width="1920" height="1080" alt="Screenshot 2025-10-29 141509" src="https://github.com/user-attachments/assets/907de6ce-c4fc-47d4-9608-242285e9369f" />





ReadVault is a beginner-friendly **Solidity smart contract** that tracks the **ownership** and **borrowing history** of both digital and physical books on the Ethereum blockchain.  

---

## 🚀 Features  
- Register new books  
- Track ownership on-chain  
- Borrow and return books securely  
- View complete borrowing history  
- Transparent & decentralized  

---

## 🧠 Smart Contract Overview  

- **Contract Name:** `ReadVault.sol`  
- **Language:** Solidity ^0.8.0  
- **Network:** Ethereum (Testnets like Sepolia recommended)  
- **Example Owner Address:** `0xa7B77995F4FBf311739F115960Be3dDa16b93b62`  

---

## 🧩 How It Works  

| Action | Function | Description |
|--------|-----------|--------------|
| Register Book | `registerBook()` | Add a new book to the vault |
| Borrow Book | `borrowBook()` | Borrow a book if it's not currently borrowed |
| Return Book | `returnBook()` | Return a borrowed book |
| View History | `getBorrowHistory()` | View all past borrowers |

---

## ⚙️ How to Deploy (Using Remix & MetaMask)

1. Open [Remix IDE](https://remix.ethereum.org)  
2. Create a new file → **`ReadVault.sol`**  
3. Paste the smart contract code  
4. Compile (Solidity version 0.8.0 or above)  
5. Deploy using **Injected Provider (MetaMask)**  
6. Interact via the Remix UI (register, borrow, return, etc.)

---

## 💾 Example Smart Contract Code  

```solidity
