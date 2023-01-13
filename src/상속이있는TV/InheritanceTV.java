package 상속이있는TV;
// 상속 관계가 있는 TV
// 오버라이딩 적용

public class InheritanceTV {
    public static void main(String[] args) {
        ProductTV lgTV = new ProductTV("우리집 TV");
        lgTV.setPower(true);
        lgTV.setVolume(10);
        lgTV.setChannel(1200, true);
        lgTV.viewTV();


    }
}
