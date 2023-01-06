package 배열을향상된for문으로사용;
// 향상된 for 문은 배열의 요소를 처음부터 끝까지 자동 순회
// 임의조작을 못 한다는게 단점
// 배열의 내부의 값을 변경 할 수 없음
public class EnhancedFor {
    public static void main(String[] args) {
        int[] score = {80, 99, 70};
        int sum = 0;


       for (int e : score) {
            sum += e;
        }
        System.out.println("총점 : " + sum);
        System.out.printf("평균 : %.2f\n",   (double)sum/score.length);
    }
}
