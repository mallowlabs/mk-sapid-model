# Sapid as a Service

This is a service that parses your codes with [Sapid](http://www.sapid.org/).
You can get AST (Abstract Syntax Tree) of your codes.
This supports Java (7) and JavaScript (EcmaScript) now.

## Running the application locally

First build with:

    $mvn clean install

Then run it with:

    $java -cp "target/classes:target/dependency/*" com.example.Main

