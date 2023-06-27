import "package:readygo/User.dart";
class Convertor {
    static User stringToUser(String user){
        List<String> elements=user.split(",,");
        User result=User(
            email: elements[2],
            password: elements[1],
            isSpecial: boolparse(elements[8]),
            money: int.parse(elements[7]),
            username: elements[0],
            name: elements[3],
            age: elements[4],
            field: elements[5],
            studentNumber: elements[6],
            profilePhoto: elements[9],
            subscription: int.parse(elements[10]),
            bySubscription: elements[11],

        );
        return result;
    }
    // static List<Book> stringToBook(String books){
    //
    // }
    static bool boolparse(String s){
        if (s==true)
            return true;
        else
            return false;
    }
}
