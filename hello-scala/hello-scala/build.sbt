scalaVersion := "2.13.3"

enablePlugins(ScalaJSPlugin)

name := "hello-world"
organization := "ch.epfl.scala"
version := "1.0"

scalaJSUseMainModuleInitializer := true

lazy val akkaVersion = "2.6.13"

libraryDependencies ++= Seq(
    "org.scala-lang.modules" %% "scala-parser-combinators" % "1.1.2",
    "com.typesafe.akka" %% "akka-actor-typed" % akkaVersion,
    "org.akka-js" %%% "akkajsactor" % "2.2.6.9",
)

