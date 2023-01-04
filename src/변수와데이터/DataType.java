package 변수와데이터;
// 변수는 camel 표기법을 따른다.(첫 글자 소문자,중간 대문자)
//혹은 snake 표기법 tax_rate
public class DataType {
    public static void main(String[] args) {
//        byte num1 = 127; // byte형은 1byte 크기이며 -128 ~ 127
//        byte num2 = -128;
//        double num3 = 0.1; // 실수를 표현하는 방법은 정확한 값이 아니라 근사치를 표현함으로 오차가 발생합니다.
//
//        for(int i = 0;  i < 1000; i++){
//
//            num3 += 0.1;
//              int _taxRate1 = 100; // 정수값을 저장할 수 있는 age 라는 변수를 선언하고 초기값으로 100을 대입
//            double value = 0.0; // 실수값을 저장할 수 있는 value 라는 변수를 선언하고 초기값을 0.0 대입

        int num1, num2; // 같은 타입으로 여러개의 변수를 선언. 콤마(,)로 구분
        double num3 = 3.14; // 실수 타입의 변수를 선언과 동시에 초기화
        int hour = 3;
        int minute = 5;
        System.out.println(hour + "시" + minute + "분");
        NameCard  nameCard = new NameCard();
        nameCard.name = "권영진";
        nameCard.age = 27;
        nameCard.address = "경기도 군포시";
        nameCard.eMail = "kyjin115@naver.com";
        nameCard.phoneNumber ="010-8279-2866";
        System.out.println(nameCard.name);

    }
}
// 사용자 정의 자료형
class NameCard {
String name;
int age;
String address;
String eMail;
String phoneNumber;
}


//        num1++;
//        //현재 값을 1 증가시키는 연산자
//        num2--;
//
//        System.out.println(num1);
//        System.out.println(num2);
//        System.out.println(num3);


