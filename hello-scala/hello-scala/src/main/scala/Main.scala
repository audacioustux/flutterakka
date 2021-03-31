package org.akkajs

import scala.language.postfixOps

import akka.actor._

import scala.scalajs.js
import scala.scalajs.js.annotation._

import com.typesafe.config.ConfigFactory

@JSExportTopLevel("PingPing")
object PingPong {
  def ppActor(matcher: String, answer: String) = Props(
    new Actor {
      def receive = {
        case matcher =>
          sender ! answer
          println(s"received $matcher sending answer $answer")
      }
    }
  )

  @JSExport
  def start(duration: Int) = {
    val system = ActorSystem("pingpong")

    val ponger = system.actorOf(ppActor("ping", "pong"))
    val pinger = system.actorOf(ppActor("pong", "ping"))

    import system.dispatcher
    import scala.concurrent.duration._
    
    pinger.!("pong")(ponger)

    system.scheduler.scheduleOnce(duration seconds){
      pinger ! PoisonPill
      ponger ! PoisonPill
      system.terminate()
    }
  }
}

object Run extends App {

}
