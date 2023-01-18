package 암호체크;


public class CheckPWClass {
    String pwd;
    void inputPW(String pass) {
        pwd = pass;
        if (validLength(pwd) && validNumber(pwd) && validUpperAlphabet(pwd) && validLowerAlphabet(pwd) && validRex(pwd)){
            System.out.println("Good password!");
        } else {
            System.out.println("Bad password!");
        }

    }

//길이체크
boolean validLength(String pwd){
    if (pwd.length() >= 10 && pwd.length()<=30) return true;
    else return false;
    }
    //숫자체크
    boolean validNumber(String pwd){
for (int i = 0; i < pwd.length(); i++){
    if (pwd.charAt(i)>='0'&& pwd.charAt(i)<='9'){
        return true;
    }
}
 return false;
}
//대문자체크
boolean validUpperAlphabet(String pwd){
    for (int i = 0; i < pwd.length(); i++) {
        if (pwd.charAt(i)>='A'&&pwd.charAt(i)<='Z'){
            return true;
        }
    }
    return false;
    }
    //소문자체크
    boolean validLowerAlphabet(String pwd){
        for (int i = 0; i < pwd.length(); i++) {
            if (pwd.charAt(i)>='a'&&pwd.charAt(i)<='z'){
                return true;
            }
        }
        return false;
    }
    //특수문자체크
    boolean validRex(String pwd){
        String specialLetter = "!%_&#+-*/";
        for (int i = 0 ; i < specialLetter.length(); i++){
            for (int j = 0; j < this.pwd.length(); j++) {
                if (specialLetter.charAt(i) == this.pwd.charAt(j)) return true;

            }
        }
        return false;
    }

}
