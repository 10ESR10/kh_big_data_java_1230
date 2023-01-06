package 최소값최대값구하기;
// 정수 값 입력
// 입력된 정수 범위의 임의의 값 입력해서 배열 생성
// 해당 배열에서 제일 작은 값과 제일 큰 값 찾기
// 정수 값 입력 : 10
// 1 3 5 7 2 4 10 10 20 15
// MIN: 1
// MAX: 20

import java.util.Scanner;

public class MinMaxArray {
    public static void main(String[] args) {
        // 키보드 입력을 위한 스캐너 생성
        Scanner sc = new Scanner(System.in);
        // 정수값 입력을 받음
        System.out.println("배열 갯수 입력: ");
        int arrNum = sc.nextInt();
        // 입력 받은 변수의 크기 만큼 배열을 생성
        int[] arr = new int[arrNum];
        // 생성된 배열 크기만큼 순회 하면서 정수값을 입력받음
        for (int i = 0; i < arr.length; i++) {
            arr[i] = sc.nextInt();
        }

        // 값을 비교하기 위해서 기준 값이 필요한데, 배열 0번째 값을 기준값으로 저장
        int min = arr[0];
        int max = arr[0];
        // 배열에서 제일 작은 값과 제일 큰 값을 찾음
        for (int e : arr) {
            if (min > e) min = e;
            if (max < e) max = e;
        }
        System.out.println("최소값 : " + min);
        System.out.println("최대값 : " + max);
    }
}
        // 출력

//        Scanner sc = new Scanner(System.in);
//        System.out.print("배열 갯수 입력 : ");
//        int arrNum = sc.nextInt();
//
//        int[] number = {1, 3, 5, 7, 2, 4, 10, 10, 20, 15};
//        int max = 1;
//        int min = 1;
//
//        for (int i = 0; i < number.length; i++ ){
//            if (number[i]> max) {
//                max=number[i];
//            }
//            if (number[i] < min) {
//                min = number[i];
//
//            }
//        }
//        System.out.println(min + "  " + max);
//
//
//    }

