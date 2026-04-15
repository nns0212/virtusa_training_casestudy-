import java.time.LocalDate;

public class Transaction {
    private int bookId;
    private int userId;
    private LocalDate issueDate;
    private LocalDate dueDate;
    private LocalDate returnDate;

    public Transaction(int bookId, int userId) {
        this.bookId = bookId;
        this.userId = userId;
        this.issueDate = LocalDate.now();
        this.dueDate = issueDate.plusDays(7); // 7-day policy
    }

    public int getBookId() { return bookId; }
    public int getUserId() { return userId; }
    public LocalDate getDueDate() { return dueDate; }

    public void returnBook() {
        this.returnDate = LocalDate.now();
    }

    public long calculateFine() {
        if (returnDate != null && returnDate.isAfter(dueDate)) {
            return java.time.temporal.ChronoUnit.DAYS.between(dueDate, returnDate) * 10;
        }
        return 0;
    }
}