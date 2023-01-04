package 입출력예제;

import java.util.Scanner;

public class SystemInOut {
    public static void main(String[] args) {
        String name = "권영진";
        String addr = "경기도 군포시";
        char gender = '남';
        int age = 30;
        int kor = 99;
        int eng = 88;
        int math = 55;

        //자바 스타일 (메소드를 오버로딩 하는 방식)
        System.out.println("====== Hava Style output======");
        System.out.print("Name" + name + "\n"); // \n 줄바꿈
        System.out.println("주소 :" + addr);
        System.out.println("성별 :" + gender);
        System.out.println("나이 :" + age);
        System.out.println("총점 :" + (kor + eng + math)); // 소괄호를 넣어서 연산자 우선순위를 바꿔준다.
        System.out.println("평균 :" + ((double) (kor + eng + math) / 3));
// C언어 스타일(서식 지정자를 사용)
        // 서식지정자 : %d 정수, %ld 롱타입, %u 부호 없을 때, %f 실수, %.2f 소수점 두 자리 까지, %s 문자열, %c 문자, %% 서식x 실제 퍼센트, %b
        // 이스케이프시퀀스 : \n(줄바꿈), \r(CR), \t 테이블, \b 백스페이스, \\
        System.out.printf("====== Hava Style output======\n");
        System.out.printf("이름 : %s, 주소 : %s\n", name, addr);
        System.out.printf("나이 : %d\n", age);
        System.out.printf("총점 : %d\n", kor + eng + math);
        System.out.printf("평균 : %.2f\n", (double) (kor + eng + math) / 3);

        System.out.printf("Apple\tBanana\tKiwi\b\b\n");
        System.out.printf("\"Enter\" 키를 입력 하시면 종료 됩니다.");
        System.out.println("HelLo\\JAVA");
        System.out.printf("오늘의 습도는 %d%%\n", 25); //서식x 실제 퍼센트


        Scanner sc = new Scanner(System.in);
        System.out.print("정수 입력 : ");
        int n = sc.nextInt();
        for (int i = 1; i <= n * n; i++) {
            System.out.printf("%4d", i); // 오른쪽으로 4칸 여유
            if (i % n == 0) System.out.println();


        }
    }
}