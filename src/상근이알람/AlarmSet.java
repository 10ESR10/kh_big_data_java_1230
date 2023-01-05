package 상근이알람;

import java.util.Scanner;

// 상근이라는 친구는 매일 학교를 지각 합니다.
// 창영이라는 친구가 상근이에게 지각하지 않는 방법을 알려 줍니다.
//시간을 설정하면 자동으로 45분 일찍 알람이 울리도록 시간이 설정되도록 함
// 24시간제
public class AlarmSet {
    public static void main(String[] args) {
        // 시간을 입력받기 위해 스캐너 객체 생성
        Scanner sc = new Scanner(System.in);
        // 생성된 객체로 시간과 분을 입력 받음(24시간제)
        System.out.println("시간을 입력하세요.");
        int hour = sc.nextInt();
        System.out.println("분을 입력하세요.");
        int min = sc.nextInt();
        int hm = (hour * 60) + min;
    }
}






