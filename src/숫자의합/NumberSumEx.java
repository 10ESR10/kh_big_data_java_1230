package 숫자의합;
// 문제 : N개의 숫자가 공백없이 쓰여있음. 이 숫자를 모두 합해서 출력하는 문제
// 입력 : 54321
// 출력 : 15
// 입력 : 70000000000
// 출력 : 7
// 입력 : 5678
// 출력 : 26
// 입력 : 0000
// 프로그램 종료


import java.util.Scanner;

public class NumberSumEx {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String number = sc.next();
        while (true) {
            int sum = 0; // 한 번 계산 결과를 출력 후 초기화가 되어야 함
            System.out.println("입력 : ");
            if (number.equals("0000")) break;
            for (int i = 0; i < number.length(); i++) {
                sum += number.charAt(i) - '0';

            }
            System.out.println("출력: " + sum);


        }
    }
}

