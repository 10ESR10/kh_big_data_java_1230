package 상근이알람;

import java.util.Scanner;

public class AlarmSet2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("시간 입력 : ");
        int hour = sc.nextInt();
        if (hour >24) System.out.println("잘못 입력 하셨습니다.");
        else if (24>=hour) System.out.println("분 입력");
        int min = sc.nextInt();
        // 변수를 만들어서 입력 받은 시간과 분을 모두 분으로 환산
        // 고려사항 : 환산한 시간이 45분 보다 적으면 별도의 계산이 필요
        int calc = (hour * 60) + min; // 하루의 시간을 분으로 환산해서 더해줌

        if (calc < 45) {
            calc = (24 * 60) + min; // 하루의 시간을 분으로 환산해서 더해줌

        }
        //창영이가 알려준 방법대로 시간을 45분 이전으로 돌림(45를 빼줌)
            calc -= 45;// calc = calc - 45;
            // 계산 결과를 시간과 분으로 출력하기 위해 다시 변환 후 출력
            System.out.printf("%d시 %d분\n", (calc / 60), (calc % 60));
        }
    }

