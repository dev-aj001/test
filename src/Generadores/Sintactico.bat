SET JAVA_HOME="C:\Program Files\Java\jdk-19\bin"
SET PATH=%JAVA_HOME%;%PATH%
SET CLASSPATH=%JAVA_HOME%;
cd C:\Users\jairi\Documents\NetBeansProjects\Automatas2\src\Analizadores\
java -jar C:\jflex-1.9.1\lib\java-cup-11b.jar -parser A_Sintactico Sintactic.cup
pause