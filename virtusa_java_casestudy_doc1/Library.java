import java.util.*;

public class Library {
    private List<Book> books = new ArrayList<>();
    private List<User> users = new ArrayList<>();
    private List<Transaction> transactions = new ArrayList<>();

    // Add Book
    public void addBook(Book book) {
        books.add(book);
        System.out.println("✅ Book added successfully!");
    }

    // Register User
    public void addUser(User user) {
        users.add(user);
        System.out.println("✅ User registered!");
    }

    // View Books (clean output)
    public void viewBooks() {
        System.out.println("\nID | Title | Author | Status");
        System.out.println("-------------------------------------");
        for (Book b : books) {
            System.out.println(b);
        }
    }

    // Issue Book
    public void issueBook(int bookId, int userId) {
        for (Book b : books) {
            if (b.getId() == bookId && !b.isIssued()) {
                b.setIssued(true);
                transactions.add(new Transaction(bookId, userId));
                System.out.println("📘 Book issued successfully!");
                return;
            }
        }
        System.out.println("❌ Book not available!");
    }

    // Return Book
    public void returnBook(int bookId) {
        for (Transaction t : transactions) {
            if (t.getBookId() == bookId) {
                t.returnBook();
                long fine = t.calculateFine();

                for (Book b : books) {
                    if (b.getId() == bookId) {
                        b.setIssued(false);
                    }
                }

                System.out.println("✅ Book returned!");
                System.out.println("💰 Fine: ₹" + fine);
                return;
            }
        }
        System.out.println("❌ Transaction not found!");
    }

    // Search Book
    public void searchBook(String keyword) {
        System.out.println("\n🔍 Search Results:");
        for (Book b : books) {
            if (b.getTitle().toLowerCase().contains(keyword.toLowerCase()) ||
                b.getAuthor().toLowerCase().contains(keyword.toLowerCase())) {
                System.out.println(b);
            }
        }
    }
}