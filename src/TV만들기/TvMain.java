package TV만들기;

public class TvMain {
    public static void main(String[] args) {
        TV samsungTv = new TV(); // 기본 생성자 호출
        TV lgTv = new TV (true, 59, 15); // 매개변수가 있는 생성자 호출
        samsungTv.getTV();
        lgTv.getTV();

        samsungTv.setON(true);
        samsungTv.setChannel(1000);
        samsungTv.setVolume(30);
        samsungTv.getTV();

    }
}
