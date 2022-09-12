exit
git status
ls -l
mvn --version
java --version
apt install openjdk-11-jre-headless
java --version
apt install openjdk-8-jre-headless
sudo yum update
ls -l
history
mkdir Git_Jenkins_Maven_Repo
cd Git_Jenkins_Maven_Repo
ls -l
Nano jenkins file today
Nano jenkins_file_today
nano jenkins_file_today
ls -l
chmod +x jenkins_file_today
ls -l
git init
nano jenkins_file_today.sh
chmod +x jenkins_file_today.sh
ls -l
git commit -m "my first commit"
git config --global user.email "adedayo_atoyebi@yahoo.com"
git branch -M main
git remote add originbottle https://github.com/Hillswealth/Git_Jenkins_Maven_Repo.git
git push -u orginbottle main
git push -u originbottle main
git remote add originbottle https://github.com/Hillswealth/Git_Jenkins_Maven_Repo.git
git push -u originbottle main
git status
git branch
git originbottle
git remote originbottle
git remote add origin https://github.com/Hillswealth/Git_Jenkins_Maven_Repo.git
git push -u origin main
git branch
git branch -M main
git branch
Git branch
git status 
git add .
git commit -m "first Commit'
git commit -m "first Commit"
git branch -M main
git branch
git remote add originbottle https://github.com/Hillswealth/Git_Jenkins_Maven_Repo.git
git push -u originbottle main
git status 
ls -l
cd ..
ls -l
java --version
sudo apt  update
java --version
apt install openjdk-11-jre-headless
java --version
mvn --version
apt install maven
mvn --version
ls -l
If you have just installed Maven, it may take a while on the first run. This is because Maven is downloading the most recent artifacts (plugin jars and other files) into your local repository. You may also need to execute the command a couple of times before it succeeds. This is because the remote server may time out before your downloads are complete. Don't worry, there are ways to fix that.
You will notice that the generate goal created a directory with the same name given as the artifactId. Change into that directory.
cd my-app
Under this directory you will notice the following standard project structure.
my-app
|-- pom.xml
`-- src
    |-- main
    |   `-- java
The src/main/java directory contains the project source code, the src/test/java directory contains the test source, and the pom.xml file is the project's Project Object Model, or POM.
The POM

The pom.xml file is the core of a project's configuration in Maven. It is a single configuration file that contains the majority of information required to build a project in just the way you want. The POM is huge and can be daunting in its complexity, but it is not necessary to understand all of the intricacies just yet to use it effectively. This project's POM is:

    <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
      <modelVersion>4.0.0</modelVersion>
     
      <groupId>com.mycompany.app</groupId>
      <artifactId>my-app</artifactId>
      <version>1.0-SNAPSHOT</version>
     
      <properties>
        <maven.compiler.source>1.7</maven.compiler.source>
        <maven.compiler.target>1.7</maven.compiler.target>
      </properties>
     
      <dependencies>
        <dependency>
          <groupId>junit</groupId>
          <artifactId>junit</artifactId>
          <version>4.12</version>
          <scope>test</scope>
        </dependency>
      </dependencies>
    </project>

What did I just do?

You executed the Maven goal archetype:generate, and passed in various parameters to that goal. The prefix archetype is the plugin that provides the goal. If you are familiar with Ant, you may conceive of this as similar to a task. This archetype:generate goal created a simple project based upon a maven-archetype-quickstart archetype. Suffice it to say for now that a plugin is a collection of goals with a general common purpose. For example the jboss-maven-plugin, whose purpose is "deal with various jboss items".
Build the Project

mvn package

The command line will print out various actions, and end with the following:

 ...
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  2.953 s
[INFO] Finished at: 2019-11-24T13:05:10+01:00
[INFO] ------------------------------------------------------------------------

Unlike the first command executed (archetype:generate), the second is simply a single word - package. Rather than a goal, this is a phase. A phase is a step in the build lifecycle, which is an ordered sequence of phases. When a phase is given, Maven executes every phase in the sequence up to and including the one defined. For example, if you execute the compile phase, the phases that actually get executed are:

    validate
    generate-sources
    process-sources
    generate-resources
    process-resources
    compile

You may test the newly compiled and packaged JAR with the following command:

java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App

Which will print the quintessential:

Hello World!

Java 9 or later

By default your version of Maven might use an old version of the maven-compiler-plugin that is not compatible with Java 9 or later versions. To target Java 9 or later, you should at least use version 3.6.0 of the maven-compiler-plugin and set the maven.compiler.release property to the Java release you are targetting (e.g. 9, 10, 11, 12, etc.).

In the following example, we have configured our Maven project to use version 3.8.1 of maven-compiler-plugin and target Java 11:

        <properties>
            <maven.compiler.release>11</maven.compiler.release>
        </properties>
     
        <build>
            <pluginManagement>
                <plugins>
                    <plugin>
                        <groupId>org.apache.maven.plugins</groupId>
                        <artifactId>maven-compiler-plugin</artifactId>
                        <version>3.8.1</version>
                    </plugin>
                </plugins>
            </pluginManagement>
        </build>

To learn more about javac's --release option, see JEP 247.
Running Maven Tools
Maven Phases
Although hardly a comprehensive list, these are the most common default lifecycle phases executed.
There are two other Maven lifecycles of note beyond the default list above. They are
Phases are actually mapped to underlying goals. The specific goals executed per phase is dependant upon the packaging type of the project. For example, package executes jar:jar if the project type is a JAR, and war:war if the project type is - you guessed it - a WAR.
An interesting thing to note is that phases and goals may be executed in sequence.
mvn clean dependency:copy-dependencies package
This command will clean the project, copy dependencies, and package the project (executing all phases up to package, of course).
Generating the Site
mvn site
This phase generates a site based upon information on the project's pom. You can look at the documentation generated under target/site.
Conclusion

We hope this quick overview has piqued your interest in the versatility of Maven. Note that this is a very truncated quick-start guide. Now you are ready for more comprehensive details concerning the actions you have just performed. Check out the Maven Getting Started Guide.





ls -l
ls -la
clear
mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false
ls -l
cd my-app
ls -l
tree pom
sudo apt install tree 
cd ..
tree my-app
cd my-app/src/main/java/com/mycompany/app
ls -l
cat App.java
nano App.java
cd ..
cd
ls -l
cd my-app
ls -l
cd 
mvn packgae
cd my-app
ls -l
mvn packgae
mvn package
mvn validate
cd 
ls -l
cd my-app
ls -l
cd target
ls -l
cd 
java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App
ls -l
cd my-app
java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App
cd ..
cd my-app
git init
git status
git add .
git commit -m "my first commit"
git push -u originbottle main
git branch -M main
git branch
git push -u originbottle main
cd ..
git push -u originbottle main
git status 
git branch
git init
git add .
git branch -M main
git status 
git commit -m "my first commit'
git commit -m "my first commit"
git statis 
git status
ls -l
git statis 
git status
cd my-app
ls -l
git staus 
git status
git init
git statis
git status
git add .
git commit -m "first commit'
git commit -m "first commit"
ls -l 
git status 
git branch 
history
exit
