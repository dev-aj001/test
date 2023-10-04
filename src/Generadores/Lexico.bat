SET JAVA_HOME="C:\Program Files\Java\jdk-19\bin"
SET PATH=%JAVA_HOME%;%PATH%
SET CLASSPATH=%JAVA_HOME%;
SET JFLEX_HOME= C:\jflex-1.9.1
cd C:\Users\jairi\Documents\NetBeansProjects\Automatas2\src\Analizadores\
java -jar %JFLEX_HOME%\lib\jflex-full-1.9.1.jar Lexer_1.jflex
pause