package 반복문연습문제2번;
// 입력 : 5
// *
// * *
// * * *
// * * * * *

import java.util.Scanner;

public class StarPrintEx {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
       System.out.print("정수를 입력하세요 : ");

       int number = sc.nextInt();

       for (int i =0; i <= number; i++){
           for (int j = 0; j < i+1; j++){
               System.out.print("*");
           }
           System.out.println();
       }

    }
}
