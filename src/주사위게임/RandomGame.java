package 주사위게임;
// 주사위 2개 던져서 합이 12이면 탈출하는 게임
public class RandomGame {

    public static void main(String[] args) {
        int rand1, rand2;
        int cnt = 0;
        while(true) {
            cnt++;
            rand1 = (int) ((Math.random() * 6) + 1); // 랜덤 함수는 실수형으로 값이 생성되므로 형변환이 필요.
            rand2 = (int) ((Math.random() * 6) + 1);


            if ((rand1 + rand2) == 12) {
                // 횟수가 정해져 있지 않으면 while문으로
                System.out.printf("무인도를 %d 번 만에 탈출 합니다.\n", cnt);
                break;
            } else {
                System.out.println("주사위의 합이 " + (rand1 + rand2) + "입니다.");
            }
        }
    }
}
