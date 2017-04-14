grammar Hello;

DIGIT : '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' ;

LETTER : ('A' | 'B' | 'C' | 'D' | 'E' | 'F' | 'G'
       | 'H' | 'I' | 'J' | 'K' | 'L' | 'M' | 'N'
       | 'O' | 'P' | 'Q' | 'R' | 'S' | 'T' | 'U'
       | 'V' | 'W' | 'X' | 'Y' | 'Z' | 'a' | 'b'
       | 'c' | 'd' | 'e' | 'f' | 'g' | 'h' | 'i'
       | 'j' | 'k' | 'l' | 'm' | 'n' | 'o' | 'p'
       | 'q' | 'r' | 's' | 't' | 'u' | 'v' | 'w'
       | 'x' | 'y' | 'z' );


//SYMBOL : ('['' | ']' | '<' | '>'
//       | ''' | ''' | '=' | '|' 
//       | '.' | ',' | ';' |'_');

ADDITION_OPERATOR : '+';
SUBTRACTION_OPERATOR : '-';
MULTIPLICATION_OPERATORr : '*';
DIVISION_OPERATOR : '/';

CHARACTER : (LETTER | DIGIT | SYMBOL);
SYMBOL: ;


IDENTIFIER : (LETTER , {LETTER | DIGIT | '_' }) ;

COMPARISON_KEYWORDS : ('Equals' | 'GreaterThan' | 'LessThan' | 'LessThanEqual' | 'GreaterThanEqual' | 'NotEqual') ;

ASSIGNMENT_KEYWORD : '=' ;

WHITESPACE : (' ' | '\t' | '\r' | '\n' | '\f') ;

IF_KEYWORD : 'if' ;
THEN_KEYWORD : 'then' ;
ELSE_KEYWORD : 'else' ;
ELSEIF_KEYWORD : 'elif' ;
RETURN_KEYWORD : return ;

OPEN_BRACE : '{' ;
CLOSE_BRACE : '}' ;

OPEN_BRACKET : '(' ;
CLOSE_BRACKET : ')' ;

FUNCTION_KEYWORD : 'Function' ;

LOGICAL_KEYWORDS : ('AND' | 'OR' | 'NOT') ;

BOOLEAN_KEYWORDS : ('true' | 'false') ;

DATATYPE : (Integer | Float | Boolean) ;

INTEGER_LITERAL : (('+'|'-')? DIGIT+) ; 

FLOAT_LITERAL : (('+'|'-')? DIGIT'.'DIGIT+)

OPERATOR : ADDITION_OPERATOR | SUBTRACTION_OPERATOR | MULTIPLICATION_OPERATOR | DIVISION_OPERATOR ;

declaration_statement : DATATYPE IDENTIFIER ;

term : INTEGER_LITERAL | FLOAT_LITERAL | IDENTIFIER ;

basic_expression : term (operator term)* ;

relational_expression : basic_expression (COMPARISON_KEYWORDS basic_expression)? ;

complex_expression : relational_expression (LOGICAL_KEYWORDS relational_expression)* ;

condition : complex_expression ;

return_statement : RETURN_KEYWORD complex_expression ;

while_loop : 'while' condition OPEN_BRACE statements CLOSE_BRACE ;

if_statement: IF_KEYWORD OPEN_BRACE statements CLOSE_BRACE ;

else_statement : ELSE_KEYWORD OPEN_BRACE statements CLOSE_BRACE ;

ifelse_statement : if_statement (else_statement)? ;

construct_statement : (ifelse_statement | while_loop) ;

assignment_statement = IDENTIFIER ASSIGNMENT_KEYWORD complex_expression ;

other_statement = (assignment_statement | declaration_statement | return_statement)? ';' ;

statements = (construct_statement | other_statement)+ ;

program : statements ;
