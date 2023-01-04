package 기본프로그램; // 접근제한자(캡슐화)와 연관성이 있음

// 접근제한자 : public, protected, default, private


//여기는 범위 주석 입니다.
//주석이란 ? 사람은 이해하고 컴파일러는 무시하는 영역
//- 저자 권영진
//- Date : 2023.01.02 오전 10:15
//- 목적 : 자바 연습용 프로그램


public class Sample {// 클래스 이름을 지정, 클래스 이름은 관례상 첫자를 대문자로 사용

    // main 메소드는 프로그램의 시작 위치를 의미하며 JVM이 호출 함.
    public static void main(String[] args) {
        //static을 붙이면 하나만 실행된다.
        //void: 메소드 실행 이후의 반환 타입 중 하나 입니다.
        // {} : 중괄호 : 클래스, 메소드 등의 범위를 결정
        //() : 소괄호 : 메소드의 매개변수를 넣는 곳
        // [] : 대괄호 : 배열 등을 정의 할 때 사용된다

        System.out.println("Hello,JAvA!!");

    }
}
//1Byte : 8bit로 구성 1bit 당 2개의 값(0 or 1)을 가질 수 있음, 표현 가능 범위는 256가지
//String : 참조형, 8Byte의 주소 공간을 가진다
//short : 2Byte, 노후해서 잘 사용 안 함, 정수를 쓴다면 int를 사용
//double : 실수형, 기본적으로 사용
//float : 기본값: 0.0f , 뒤에 f를 붙여야 하기 때문에 double을 쓰는게 편리하다

