package 암호체크;


public class CheckPWClass {
    String password;
    void inputPW(String pass) {
        password = pass;
        if (validLength() && validNumber() && validUpperAlphabet() && validLowerAlphabet() && validRex()){
            System.out.println("Good password!");
        } else {
            System.out.println("Bad password!");
        }

    }


boolean validLength(){
    if (password.length() >= 10 && password.length()<=30) return true;
    else return false;
    }
    boolean validNumber(){
for (int i = 0; i < password.length(); i++){
    if (password.charAt(i)>='0'&& password.charAt(i)<='9'){
        return true;
    }
}
 return false;
}
boolean validUpperAlphabet(){
    for (int i = 0; i < password.length(); i++) {
        if (password.charAt(i)>='A'&&password.charAt(i)<='Z'){
            return true;
        }
    }
    return false;
    }
    boolean validLowerAlphabet(){
        for (int i = 0; i < password.length(); i++) {
            if (password.charAt(i)>='a'&&password.charAt(i)<='z'){
                return true;
            }
        }
        return false;
    }
    boolean validRex(){
        String specialLetter = "!%_&#+-*/";
        for (int i = 0 ; i < specialLetter.length(); i++){
            for (int j = 0; j < password.length(); j++) {
                if (specialLetter.charAt(i) == password.charAt(j)) return true;

            }
        }
        return false;
    }
}
