package 상속실습예제;

public class Person {

    int age;
    int sleep;
    void setAge(int age){
        this.age=age;

    }
    int getAge(){
        return age;
    }
    void setSleep(int sleep){
        this.sleep=sleep;
    }
    int getSleep(){
        return sleep;
    }
}
class Worker extends Person{
    int work;
    void  setWork(int work){
        this.work = work;
    }
    int getWork(){
        return work;
    }

}


class Student extends Person {
    int study;

    void setStudy(int study) {
        this.study = study;
    }

    String getStudy() {
        String[] StudyStr = {"", "\"열심히\"", "\"적당히\"", "\"놀면서\""};
return StudyStr[study];
    }
}

