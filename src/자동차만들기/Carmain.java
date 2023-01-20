package 자동차만들기;

import java.util.Scanner;

public class Carmain {
    public static void main(String[] args) {
        Car car = null;

        Scanner sc = new Scanner(System.in);
        System.out.println("이동 지역을 선택하세요 [1]부산 [2]대전 [3]강릉 [4]광주 : ");
        int location = sc.nextInt();
        System.out.println("이동할 승객 수를 입력하세요(1~100) : ");
        int passCnt = sc.nextInt();
        System.out.println("이동 차량을 선택하세요 [1]스포츠카 [2]승용차 [3]버스");
        int moveCar = sc.nextInt();
        System.out.println("부가기능을 선택하세요 [1]ON [2]OFF");
        int option = sc.nextInt();
        boolean isOption = (option == 1)? true : false;


    }
}
