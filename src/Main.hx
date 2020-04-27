import js.html.ErrorEvent;
import haxe.Timer;
import js.html.CloseEvent;
import js.html.MessageEvent;
import js.html.Event;
import haxe.Json;
import js.html.WebSocket;
import js.html.Document;
import js.Browser;

class Main {
    static function main() {
        connect();
    }

    static function connect() {
        var doc = Browser.document;
        var ws = new WebSocket("ws://localhost:80/StreamCompanion/LiveData/Stream");
        
        ws.onmessage = function (e: MessageEvent) {
            var json = Json.parse(e.data);
            //doc.getElementById("all").innerHTML = e.data;
            doc.getElementById("livepp").innerHTML = json.livepp;
            doc.getElementById("maxpp").innerHTML = json.maxpp;
            doc.getElementById("c100").innerHTML = json.c100;
            doc.getElementById("c50").innerHTML = json.c50;
            doc.getElementById("miss").innerHTML = json.miss;
        };

        ws.onclose = function (e: CloseEvent) {
            trace('Socket closed. Reconnecting in 2 seconds. Reason: ${e.reason}');
            Timer.delay(() -> connect(), 2000);
        } 

        ws.onerror = function (e: ErrorEvent) {
            trace('Socket closed due to error. Reconnecting in 2 seconds. Reason: ${e.error}');
            Timer.delay(() -> connect(), 2000);
        } 

        doc.onclose = function () {
            ws.close();
        }
    }
}