import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Library lib = new Library();
        Scanner sc = new Scanner(System.in);

        while (true) {
            System.out.println("\n===== Library System =====");
            System.out.println("1. Add Book");
            System.out.println("2. Register User");
            System.out.println("3. View Books");
            System.out.println("4. Issue Book");
            System.out.println("5. Return Book");
            System.out.println("6. Search Book");
            System.out.println("7. Exit");
            System.out.print("Choose: ");

            int ch = sc.nextInt();
            sc.nextLine();

            switch (ch) {
                case 1:
                    System.out.print("Enter ID: ");
                    int id = sc.nextInt(); sc.nextLine();
                    System.out.print("Title: ");
                    String title = sc.nextLine();
                    System.out.print("Author: ");
                    String author = sc.nextLine();
                    lib.addBook(new Book(id, title, author));
                    break;

                case 2:
                    System.out.print("User ID: ");
                    int uid = sc.nextInt(); sc.nextLine();
                    System.out.print("Name: ");
                    String name = sc.nextLine();
                    lib.addUser(new User(uid, name));
                    break;

                case 3:
                    lib.viewBooks();
                    break;

                case 4:
                    System.out.print("Book ID: ");
                    int bid = sc.nextInt();
                    System.out.print("User ID: ");
                    int u = sc.nextInt();
                    lib.issueBook(bid, u);
                    break;

                case 5:
                    System.out.print("Book ID: ");
                    int rid = sc.nextInt();
                    lib.returnBook(rid);
                    break;

                case 6:
                    System.out.print("Search keyword: ");
                    String key = sc.nextLine();
                    lib.searchBook(key);
                    break;

                case 7:
                    System.exit(0);
            }
        }
    }
}