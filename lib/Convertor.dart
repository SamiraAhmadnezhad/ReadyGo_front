
import 'package:readygo/Comment.dart';
import "package:readygo/Book.dart";
import "package:readygo/Genre.dart";
import "package:readygo/User.dart";
class Convertor {
    static User stringToUser(String user){
        List<String> elements=user.split(",,");
        User result=User(
            email: elements[1],
            password: elements[2],
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
    static List<Book> stringToBook(String books){
        //print(books);
        List<Book> result= [];
        List<String> elements=books.split("**");
        //print(elements[0]);
        for (String ss in elements){
            List<String> s=ss.split("&&");
            Book b=Book(
                png: s[3],
                name: s[0],
                author: s[1],
                genre: genreparse(s[2]),
                isFree: boolparse(s[4]),
                isAvailable: boolparse(s[8]),
                price: int.parse(s[6]),
                special: boolparse(s[5]),
                year: int.parse(s[7]),
                isNew: boolparse(s[10]),
                about: s[11],
                sellNum: int.parse(s[9]),
                like: int.parse(s[12]),
                rate: double.parse(s[13]),
                isAudioBook: boolparse(s[14]),
                comments: stringToComment(s[15]),
            );
            result.add(b);
        }
        return result;
    }
    static List<Comment> stringToComment (String comments){
        print(comments);
        List<Comment> result=[];
        List<String> elements=comments.split("--");
        print(elements[0]);
        for (String ss in elements){
            List<String> s=ss.split("##");
            Comment c= Comment(
                nameUser: s[0],
                commentMassage: s[1],
                like: int.parse(s[2]),
                dislike: int.parse(s[3]),
            );
            result.add(c);
        }
        return result;
    }
    static Genre genreparse(String s){
        if (s=="Scary")
            return Genre.Scary;
        else if (s=="Criminal")
            return Genre.Criminal;
        else if (s=="Romantic")
            return Genre.Romantic;
        else if (s=="Fantasy")
            return Genre.Fantasy;
        else
            return Genre.Academic;
    }
    static bool boolparse(String s){
        if (s=="true")
            return true;
        else
            return false;
    }
}
