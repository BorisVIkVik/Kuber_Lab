name := "TestSpark"
version := "2.0"
libraryDependencies += "org.apache.spark" %% "spark-core" % "3.4.0"
libraryDependencies += "org.apache.spark" %% "spark-sql" % "3.4.0"
libraryDependencies ++= Seq(
  "com.typesafe.akka" %% "akka-http" % "10.5.3",
  "com.typesafe.akka" %% "akka-stream" % "2.8.8",
  "com.typesafe.akka" %% "akka-actor" % "2.8.8"
)
fork := true


javaOptions ++= Seq(
  "--add-exports=java.base/sun.nio.ch=ALL-UNNAMED",
  "--add-opens=java.base/sun.nio.ch=ALL-UNNAMED",
  "--add-opens=java.base/java.nio=ALL-UNNAMED"
)

dockerBaseImage := "eclipse-temurin:11"
Docker / version := "latest" 
Docker / packageName := "borisvikvik/scala-datamart"
Docker / dockerUpdateLatest := true

outputStrategy := Some(StdoutOutput)


enablePlugins(JavaAppPackaging)
enablePlugins(DockerPlugin)

mainClass in (Compile, run) := Some("FileDemo")