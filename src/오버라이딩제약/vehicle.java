package 오버라이딩제약;

public class vehicle {
   protected int speed; // protected 상속관계와 동일 패키지 내에서 접근 가능
    protected String colors;
    protected String name;
    // final은 최종상태를 의미하며, 메소드에서 사용 시 오버로딩이 불가함을 의미합니다
    final void accelerator(){
        System.out.println("차의 속도를 증가 시킵니다." +"");
    }
   final void  breakPanel() {
        System.out.println("차의 속도를 감소 시킵니다.");
    }
}

class SportsCar extends  vehicle{
   private boolean isTurbo;
    SportsCar(String name) {
        isTurbo = false; // 터보모드가 켜지면 차의 최고속도를 증가시키는 기능, 상속 받은 기능이 아님
        speed = 200; // vehicle로 부터 상속 받음
        this.name = name; // 생성자로 부터 이름을 입력 받아 인스턴스 필드의 초기값을 사용
        colors = "Red";
    }

    int getSpeed() {// 게터라고 부른다.
        if(isTurbo) return speed *= 1.2;
        return speed;
         }
         boolean getTurbo() { // 게터
        return isTurbo;


         }
         void setTurbo(boolean x) {
        isTurbo = x;




         }
         void infoCar() {
        System.out.println("이름 : " + name);
        System.out.println("속도 : " + getSpeed());
        System.out.println("색상 : " + colors);
        System.out.println("터보모드 : " + isTurbo);
         }
}
class ElectricCar extends vehicle{
    boolean isAutoDrv;
    ElectricCar(String name) {
        isAutoDrv = false;
        speed = 200;
        this.name = name;
        colors = "White";

    }
    boolean getAutoDrv() {
        return isAutoDrv;
    }
    void  setAutoDrv(boolean autoDrv) {
        isAutoDrv = autoDrv;

    }
    void infocar() {
        System.out.println("이름 " + name);
        System.out.println("속도 : " + speed);
        System.out.println("색상 : " + colors);
        System.out.println("자율주행 : " + isAutoDrv);
    }


}