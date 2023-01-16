package 정적메소드;

import static 정적메소드.Util.DOMAIN;

public class StaticMethod {
    public static void main(String[] args) {
        Bank KaKao = new Bank("카카오", 1000);
        Bank ShinHan = new Bank("신한", 1000);
        Bank nh = new Bank("농협", 0);
        KaKao.setDeposit(2000);
        KaKao.setWithdraw(1580);
        KaKao.viewAccount();


        System.out.println(Bank.getCount()); // getCount() 메소드는 정적메소드 이며, 클래스 소속

        System.out.println("현재 시간을 출력 합니다.");
        System.out.println(Util.getCurrentDate("yyyy년MM월dd일-hh:mm:ss"));
        System.out.println("도메인 주소 : " + DOMAIN);
    }
}
