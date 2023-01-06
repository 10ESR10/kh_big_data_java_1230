package 배열기본;

public class BasicArray {
    public static void main(String[] args) {
        //int [] score = {90, 88, 70}; // 이게 더 편함
        int[] score = new int[3]; // 타입[] 참조변수 = new 타입[크기];, new는 무조건 Heap영역
        score[0] = 90;
        score[1] = 88;
        score[2] = 70;
        //int sum = score[0] + score[1] + score [3]; // 이렇게 해도 상관 없지만 값이 많으면 효율적이지 못 함
        int sum = 0;
        for(int i = 0; i < score.length; i++) {
            sum += score[i]; // sum = sum + score[i];


        }
        System.out.println("총점 : " + sum);
        System.out.printf("평균 : %.2f\n",   (double)sum/score.length);
    }
}
