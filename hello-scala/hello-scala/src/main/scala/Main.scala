import scala.language.postfixOps

import akka.actor._
import scala.util.Try
import scala.scalajs.js
import scala.scalajs.js.annotation._

import com.typesafe.config.ConfigFactory

@js.native
@JSGlobalScope
object jsGlobals extends js.Any {
  @JSName("_cast")
  def _cast(matcher: js.Any, msg: String): js.Any = js.native
}

@JSExportTopLevel("PingPong")
object PingPong {
  var system: ActorSystem = ActorSystem("pingpong")
  val ponger = system.actorOf(ppActor("ping", "pong"))
  val pinger = system.actorOf(ppActor("pong", "ping"))

  def ppActor(matcher: String, answer: String) = Props(
    new Actor {
      def receive = { case matcher =>
        jsGlobals._cast(
          s"$matcher",
          s"received $matcher sending answer $answer"
        )
      }
    }
  )

  @JSExport
  def ping() = pinger.!("ping")(ponger)
  @JSExport
  def pong() = ponger.!("pong")(pinger)
}

object Run extends App {}
