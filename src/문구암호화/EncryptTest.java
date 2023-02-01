package 문구암호화;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class EncryptTest {
    // 암호화키의 반복 : lovelovelove => love 문자열을 입력 받은 문자 배열로 만듬, 문자 배열의 길이는 4 (0, 1, 2, 3)
    //                    nice day
    // a b c d e f g h i j  k  l  m  n  o  p  q r s t u v w x y z
    // 1 2 3 4 5 6 7 8 9 10 11 12 13 14
    // 만약에 결과가 음수가 나오면 해당값에서 26 만큼 더해줌
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("평문 : ");
        String normal = sc.nextLine(); // 평문은 공백 있음
        System.out.println("암호화 키 : ");
        String encrypt = sc.next();
        char[] enc = encrypt.toCharArray(); // 암호화키를 문자 배열로 변경
        char value = 0; // 암호문을 만들기 위한 문자 변수
        List<Character> vig = new ArrayList<>();
        for (int i = 0; i < normal.length(); i++) {
            if (normal.charAt(i) == ' ') vig.add(' ');
            else {
                value = (char)(normal.charAt(i) - (enc[i % encrypt.length()] - 'a') - 1);
                if (value < 'a') value += 26;
                vig.add(value);

            }
        }
        for (Character e : vig) System.out.println(e);
    }
}

