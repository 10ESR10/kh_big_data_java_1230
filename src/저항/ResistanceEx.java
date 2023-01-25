package 저항;

import java.util.Scanner;

// 전자 제품에서는 저항이 들어간다. 처음 색 2개는 저항의 값, 마지막은 곱해야 하는 값
// 색 : black, brown, red, orange, yellow, green, blue, violet, grey, white
// 값 : 0,1,2,3,4,5,6,7,8,9
// 곱 : 1, 10, 100, 1,000  , 10,000 , 100,000 , 1,000,000 , 10,000,000 , 100,000,000 , 1,000,000,000
// 입력 : yellow violet red
// 결과 4,700
// 입력 : orange red blue
// 결과 32,000,000
// 입력 : white white white
// 결과 : 99,000,000,000
public class ResistanceEx {
    public static void main(String[] args) {
        // 컬러값에 대한 문자열 배열 정의(define), 문자열을 비교해서 인덱스를 찾기 위해
        String [] color ={"black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"};
        int [] num ={1,10,100,1000,10000,100000,1000000,10000000,100000000,1000000000};
        int fVal=0, sVal=0, tVal=0;
        Scanner sc = new Scanner(System.in);
        System.out.println("입력 : ");
        String fColor = sc.next();
        String sColor = sc.next();
        String tColor = sc.next();
        for (int i = 0; i < color.length; i++) {
           if (fColor.equals(color[i])) fVal = i; // 첫 번째 입력 받은 컬러 문자열과 배열의 컬러 이름이 같으면 인덱스를 대입
           if (sColor.equals(color[i])) sVal = i; //
           if (tColor.equals(color[i])) tVal = i;
        }
        // Math.pow(2,4) 2 * 2 * 2 * 2 , 제곱함수를 사용해서 풀기
        // 정수값 범위를 벗어 날 수 있으므로 long으로 형변환 해줌
        System.out.println((long)((fVal*10)+sVal)* (long)(Math.pow(10,tVal)));




    }
}
