import scala.language.postfixOps

import akka.actor._
import scala.util.Try
import scala.scalajs.js
import scala.scalajs.js.annotation._

import com.typesafe.config.ConfigFactory

@JSExportTopLevel("PingPong")
object PingPong {
  var system: ActorSystem = ActorSystem("pingpong")
  val ponger = system.actorOf(ppActor("ping", "pong"))
  val pinger = system.actorOf(ppActor("pong", "ping"))

  def ppActor(matcher: String, answer: String) = Props(
    new Actor {
      def receive = { case matcher =>
        println(s"received $matcher sending answer $answer")
      }
    }
  )

  @JSExport
  def ping() = pinger.!("ping")(ponger)
  @JSExport
  def pong() = ponger.!("pong")(pinger)
}

object Run extends App {}
