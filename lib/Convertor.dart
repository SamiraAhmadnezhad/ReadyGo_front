
import 'package:readygo/Comment.dart';
import "package:readygo/Book.dart";
import "package:readygo/Genre.dart";
import "package:readygo/User.dart";
import "package:readygo/pages/getListBook.dart";
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
            favoriteBooks: stringToBookUser(elements[10]),
            recentBooks: stringToBookUser(elements[11]),
            purchasedBooks: stringToBookUser(elements[12]),
        );
        return result;
    }
    static List<Book>? stringToBookUser(String books){
        List<Book> result= [];
        if (books.isEmpty || books==null || books==" ")
            return null;
        List<String> elements=books.split("**");
        for (String ss in elements){
            if (ss=='' )
                continue;
            List<String> s=ss.split("&&");
            for (Book b in getListBook.books) {
                if (b.name==s[0] && b.author==s[1])
                    result.add(b);
            }
        }
        return result;
    }
    static List<Book>? stringToBook(String books){
        List<Book> result= [];
        if (books.isEmpty || books==null || books==" ")
            return null;
        List<String> elements=books.split("**");
        for (String ss in elements){
            if (ss=='' )
                continue;
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
                numRate: int.parse(s[13]),
                rate: double.parse(s[14]),
                isAudioBook: boolparse(s[15]),
                comments: stringToComment(s[16]),
            );
            result.add(b);
        }
        return result;
    }
    static List<Comment> stringToComment (String comments){
        List<Comment> result=[];
        if (comments==null || comments.isEmpty || comments==" ")
            return result;
        List<String> elements=comments.split("--");
        for (String ss in elements){
            if (ss=='' )
                continue;
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
    static String userToString (User user){
        String result='';
        result+=user.username+",,"+user.email+",,"+user.password+",,"+user.name+",,"+user.age+",,"+user.field+",,"+user.studentNumber+",,"+user.money.toString()+",,"+boolToString(user.isSpecial)+",,"+user.profilePhoto+",,"+booksToString(user.favoriteBooks)+',,'+booksToString(user.recentBooks)+",,"+booksToString(user.purchasedBooks)+",,";
        return result;
    }
    static String booksToString (List<Book>? book){
        String result='';
        if (book==null || book.isEmpty)
            return " ";
        for (Book  b in book!){
            result+=b.name+"&&"+b.author+"&&"+genreToString(b.genre)+"&&"+b.png+"&&"+boolToString(b.isFree)+"&&"+boolToString(b.special)+"&&"+b.price.toString()+"&&"+b.year.toString()+"&&"+boolToString(b.isAvailable)+"&&"+b.sellNum.toString()+"&&"+boolToString(b.isNew)+"&&"+b.about+"&&"+b.like.toString()+"&&"+b.numRate.toString()+"&&"+b.rate.toString()+"&&"+boolToString(b.isAudioBook)+"&&"+commentToString(b.comments)+"&&**";
        }
        return result;
    }
    static String bookToString (Book b){
        String result='';
        if (b==null)
            return " ";
        result+=b.name+"&&"+b.author+"&&"+genreToString(b.genre)+"&&"+b.png+"&&"+boolToString(b.isFree)+"&&"+boolToString(b.special)+"&&"+b.price.toString()+"&&"+b.year.toString()+"&&"+boolToString(b.isAvailable)+"&&"+b.sellNum.toString()+"&&"+boolToString(b.isNew)+"&&"+b.about+"&&"+b.like.toString()+"&&"+b.rate.toString()+"&&"+boolToString(b.isAudioBook)+"&&"+commentToString(b.comments)+"&&";
        print(result);
        return result;
    }
    static String commentToString (List<Comment>? comment){
        String result='';
        if (comment==null|| comment.isEmpty)
            return " ";
        for (Comment c in comment!){
            result+=c.nameUser+"##"+c.commentMassage+"##"+c.like.toString()+"##"+c.dislike.toString()+"##--";
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
    static String genreToString(Genre g){
        if (g==Genre.Scary)
            return "Scary";
        else if (g==Genre.Criminal)
            return "Criminal";
        else if (g==Genre.Romantic)
            return "Romantic";
        else if (g==Genre.Fantasy)
            return "Fantasy";
        else
            return "Academic";
    }
    static bool boolparse(String s){
        if (s=="true")
            return true;
        else
            return false;
    }
    static String boolToString(bool b){
        if (b)
            return "true";
        else
            return "false";
    }
}
