package 추상메소드;
// 추상클래스 만들기
// 인스턴스 필드 포함, 생성자 포함, 인스턴스 메소드 포함

public class AbstractMainEx2 {
    public static void main(String[] args) {
       Phone phone = new SmartPhone("Galaxy S22");
       phone.setPower(true);
       phone.call();
       phone.internet();


    }
}

