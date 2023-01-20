package 자동차만들기;

public class Sedan extends Car{

    public Sedan(String name){

        this.gasMil = 12;
        this.maxSpeed = 200;
        this.fuelTank = 45;
        this.seat = 4;
    }


    @Override
    void setOption(boolean isOption) {
        if(isOption) seat +=1;

    }
}
