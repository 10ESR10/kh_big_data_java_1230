package 자동차만들기;

abstract class Car {
    int maxSpeed;
    int gasMil;
    int fuelTank;
    int seat;
    String name;


    abstract void setOption(boolean isOption);
}
