package 추상메소드;

public abstract class Phone {
    String name;
    boolean isPower;

    Phone(String name) { //매개변수가 있는 생성자를 만듬
        this.name = name;
    }

    void setPower(boolean power) {
        isPower = power;
        if (isPower) {
            System.out.println("Phone Power ON");
        } else {
            System.out.println("Phone Power OFF");
        }

    }

    abstract void call(); // 상속을 받는 클래스에서 반드시 오버라이딩해서 구현 해야함
    abstract void internet();
}
