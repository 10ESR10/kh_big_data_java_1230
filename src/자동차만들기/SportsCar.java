package 자동차만들기;

public class SportsCar extends Car {
    public  SportsCar(String name) {
        this.name = name;
        this.maxSpeed = 250;
        this.gasMil = 8;
        this.fuelTank = 30;
        this.seat = 2;
    }


    @Override
    void setOption(boolean isOption) {
        if (isOption)
            maxSpeed *= 1.2;

    }




}
