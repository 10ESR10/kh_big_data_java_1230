package 암호체크;

import java.util.Scanner;

// 암호체크
// 암호의 길이는 10 ~ 30자 사이 (10 <= len <= 30)
// 암호에는 숫자, 소문자, 대문자, 특수 문자가 포함되어야 함
// 특수문자는 (!, %, _, #, &, +, -, *, /)의 9개 중의 하나
// 입력 받은 패스워드가 조건을 만족하면 "Good password", 만족하지 않으면 "Bad password"출력
// 반복문을 사용하고 사용자가 "종료" 또는 "exit"를 입력하면 프로그램 종료
public class PwdCheckMain {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        CheckPWClass checkPW = new CheckPWClass();
        String pwd;
        while (true) {
            System.out.print("암호 입력 : ");
            pwd = sc.next();
            if (pwd.equals("종료") || pwd.equalsIgnoreCase("quit")) break;
            checkPW.inputPW(pwd);

            if (!checkPW.validLength(pwd)) {
                System.out.println("Bad Length password");
                continue;
            }

            if (!checkPW.validNumber(pwd)) {
                System.out.println("Bad Number Password");
                continue;

            }
            if (!checkPW.validLowerAlphabet(pwd)) {
                System.out.println("Bad LowerAlphabet password");
                continue;

            }
            if (!checkPW.validUpperAlphabet(pwd)) {
                System.out.println("Bad UpperAlphabet password");
                continue;

            }
            if(!checkPW.validRex(pwd)) {
                System.out.println("Bad Rex password");
                continue;
            }
           System.out.println("Good password");
        }
    }
}
