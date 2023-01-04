package 타입변환;
// 타입 변환이란? 하나의 타입을 다른 타입으로 변경 하는 것
// 묵시적 형변환(Auto, 자동 형변환) : 컴파일러가 유리한 방향으로 형을 변경해주는 것
// 명시적 형변환 : 개발자가 의도한대로 형변환을 하는 것
// 메소드를 이용한 형변환 : Interger.parseInt(); 문자열을 정수 타입으로 변경
// Double.parseSoble() : 문자열을 실수 타입으로 변경
// 진수표현 : 16진수, 10진수, 8진수, 2진수
public class TypeEx {
    public static void main(String[] args) {

        int var1 = 0b1010; // 2진수 = 10
        int var2 = 0267; // 8진수
        int var3 = 399; // 10진수
        int var4 = 0x100abc; // 16진수
        System.out.println("var1 : " +var1);
        System.out.println("var2 : " +var2);
        System.out.println("var3 : " +var3);
        System.out.println("var4 : " +var4);
    }
}
