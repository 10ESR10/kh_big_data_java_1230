package 인터페이스활용;

public class CustomerTest {
    public static void main(String[] args) {
        Customer customer = new Customer();
        Buy buyer = customer;
        buyer.buy();
        buyer.order(); // 재정의된 메소드가 호출됨

        Sell seller = customer;
        seller.sell();;
        seller.order();
    }
}
