package main.java.org.example;

public class Token {

     //Keywords
     public static final int IF=0;
     public static final int THEN=1;
     public static final int ELSE=2;
     public static final int FOR=3;
     public static final int WHILE=4;

     //Literals
     public static final int INT=5;
     public static final int FLOAT=6;

     //Separators
     public static final int OPT=7;
     public static final int QTT=8;
     public static final int OPG=9;
     public static final int QTG=10;
     public static final int OPQ=11;
     public static final int QTQ=12;
     public static final int VIR=13;
     public static final int PVIR=14;

     //Relop
     public static final int MIN=15;
     public static final int MINEQ=16;
     public static final int EQ=17;
     public static final int DIS=18;
     public static final int MAX=19;
     public static final int MAXEQ=20;
     public static final int ASSIGN=21;

     //Arithmetic Operators
     public static final int ADD=22;
     public static final int SUB=23;
     public static final int MUL=24;
     public static final int DIV=25;
     public static final int MOD=26;

     //Logic Operators
     public static final int AND=27;
     public static final int OR=28;

     //Identifiers
     public static final int ID=29;

     public static final int ERROR=30;

     //End of File
     public static final int EOF = -1;

     //Array di Token per l'indicizzazione
     public static String[] AccessTokens = {"IF","THEN","ELSE","FOR","WHILE","INT","FLOAT","OPT","QTT","OPG","QTG","OPQ","QTQ","VIR","PVIR", "MIN","MINEQ", "EQ","DIS","MAX","MAXEQ","ASSIGN","ADD","SUB","MUL","DIV","MOD","AND","OR","ID","ERROR"};

}
