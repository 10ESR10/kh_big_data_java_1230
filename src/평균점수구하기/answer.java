package 평균점수구하기;

import java.util.Scanner;

public class answer {
    public static void main(String[] args) {
        // 스캐너 객체 생성
        Scanner sc = new Scanner(System.in);
        // 5명의 성적을 저장하기 위한 배열 생성
        int[] score = new int [5];
        int total = 0;
        // 배열을 순회하면서 5명의 성적을 입력 받으면서 성적이 40점
        for (int i = 0; i < score.length; i++){
            score[i] = sc.nextInt();
            if (score[i] < 40) score[i] = 40;
            // 평균을 구하기 위해서 성적으로 모두 합산 함
            total += score[i];

        }
        // 합산된 성적으로 인원수로 나누어 평균을 구함
        System.out.println(total/5);
    }
}
