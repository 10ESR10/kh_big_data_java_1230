package 클래스정렬연습문제;
// 학생의 수를 입력 받기
// 학생의 수 만큼의 객체를 생성하여 정보를 입력 (이름 성적 학번)
// 학생의 성적이 높은 순으로 결과를 표시하고 성적이 같으면 학번 순으로 정렬
// 그리고 출력시 등수가 표기 되도록 할 것
// [입력 예시]
// 학생 수 입력 :
// 안유진 99 202301
// 정국 87 202302
// 채연 88 202303
// [출력 예시]
// =====학생 성적 출력=====
// ------------------
// 석차 성적 이름 학번
// ------------------
// 1 99 안유진 202301
// 2 97 정국 202302
// 석차가 같은 경우에 대한 고려가 필요


import java.util.Scanner;
import java.util.TreeSet;

public class ClassSortEx1 {
    public static void main(String[] args) {
        TreeSet<Study> ts = new TreeSet<>(new Rank());
        Scanner sc = new Scanner(System.in);
        System.out.print("학생 수 입력 : ");
        int n = sc.nextInt();
        int cnt = 0;
        int preScore = 0;
        for (int i = 0; i < n; i++) { // 입력 받은 학생 수 만큼 순회
            ts.add(new Study(sc.next(), sc.nextInt(), sc.nextLine()));
        }
        System.out.println("====학생 성적 출력 ====");
        System.out.println("---------------------");
        System.out.println("석차   성적   이름   학번");
        System.out.println("---------------------");
        for (Study e : ts) {
            if (preScore != e.grade) cnt++;
            System.out.printf("%d%6d%5s%5s\n", cnt, e.grade, e.name, e.grdNum);
            preScore = e.grade; //  현재 점수를 변수에 저장
        }
        System.out.println("---------------------");




    }
}
