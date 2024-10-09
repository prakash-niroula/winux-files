if ( "%1" == "" ) (
  echo Project name not provided.
  exit /B
) else (
"C:\Users\Prakash Niroula\.jdks\openjdk-20.0.2\bin\java.exe" "-javaagent:C:\Program Files\JetBrains\IntelliJ IDEA Community Edition 2023.2\lib\idea_rt.jar=61217:C:\Program Files\JetBrains\IntelliJ IDEA Community Edition 2023.2\bin" -Dfile.encoding=UTF-8 -Dsun.stdout.encoding=UTF-8 -Dsun.stderr.encoding=UTF-8 -classpath "%1\out\production\%1" Main
)