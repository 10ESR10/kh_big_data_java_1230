package 자동차만들기;
public class Bus extends Car {
    public Bus(String name) {
        this.name = name;
        this.maxSpeed = 150;
        this.gasMil = 5;
        this.fuelTank = 100;
        this.seat = 20;


    }


    @Override

    void setOption(boolean isOption) {if(isOption) fuelTank +=30;}



}
