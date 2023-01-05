package 반복문유효값체크;

import java.util.Scanner;

// 반복문을 이용해서 유효값 체크 하기 (while 반복문 사용)
// do ~ while() : 먼저 수행 후 조건 확인

public class validCheck {
    public static void main(String[] args) {
        int age;
        Scanner sc = new Scanner(System.in);
        boolean isFirst = true;
        do {
            if(!isFirst) System.out.println("나이를 잘 못 입력 하셨습니다.");
            System.out.println("나이룰 입력 하세요 : ");
            age = sc.nextInt();
            isFirst = false;
        } while (age <= 0 || age >= 200); // 잘 안 씀
//        while (true) {
//            System.out.println("나이를 입력하세요 : ");
//            age = sc.nextInt();
//            if (age > 0 && age < 200) break;
//            System.out.println("나이를 잘못 입력 하셨습니다.");

        System.out.println("입력 하신 나이는 " + age + "입니다.");
    }
}
