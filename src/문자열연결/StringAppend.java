package 문자열연결;

import java.util.Scanner;

// 문자열 추가하기
// 첫 번째 문자열 입력 : seoul
// 두 번째 문자열 입력 : korea
// 정수값 입력 : 2
// 첫 번째 문자열에서 입력 받은 정수 갯수 만큼 문자를 뒤에서 부터 잘라, 두 번째 문자열 앞에 추가하기
//  ulkorea
// 3을 입력하면 oulkorea
// 힌트1 substring(index) : 문자열의 시작 위치 부터 끝까지 잘라냄
// 힌트2 substring 메소드를 이용해 문자열 추출하기 전에 index 계산이 필요
public class StringAppend {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("첫 번째 문자열 입력 : " );
        String fstStr = sc.next(); // 첫번째 문자열 입력 받음
        System.out.print("두 번째 문자열 입력 : ");
        String secStr = sc.next();
        System.out.print("정수 입력 : ");
        int n = sc.nextInt();
        int position = fstStr.length() - n;
        String sub = fstStr.substring(position);
        System.out.println(sub+secStr);

//        String e = "seoul";
//        String l = "korea";
//        String k = e + l;
//        System.out.println(k.substring(2)); // 시작 부터 끝까지 추출
//        System.out.println(k.substring(3));
    }
}
