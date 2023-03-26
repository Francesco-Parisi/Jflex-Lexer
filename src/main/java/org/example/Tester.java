package main.java.org.example;
import java_cup.runtime.Symbol; 		//This is how we pass tokens to the parser
import java.io.FileNotFoundException;
import de.jflex.example.standalone.Lexer;

public class Tester {

     public static void main(String[] args) throws FileNotFoundException {
          Lexer lexicalAnalyzer = new Lexer(new java.io.FileReader(args[0]));

               Symbol token;
               try {
                    while ((token = lexicalAnalyzer.next_token()) != null) {
                         if(token.sym == Token.EOF) { //Se il file è terminato
                              break;
                         }
                         if(token.value == null) { //Se il token appartiene alle KeyWords
                              System.out.println("<" + Token.AccessTokens[token.sym] + ">");
                         }else{ //Se è presente un valore lo stampa insieme al Token riconosciuto
                              System.out.println("<"+ Token.AccessTokens[token.sym]+"," +token.value+">");
                         }
                    }
               } catch (Exception e) {
                    System.out.println("Error: Parsing Ended");
               }
     }

}