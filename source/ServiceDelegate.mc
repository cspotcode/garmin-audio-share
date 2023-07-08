import Toybox.System;
import Toybox.Background;
import Toybox.Communications;
import Toybox.Lang;

(:background)
class AudioShareServiceDelegate extends ServiceDelegate {
    public function initialize() {
        ServiceDelegate.initialize();
        Background.registerForPhoneAppMessageEvent();
    }

    function onPhoneAppMessage(msg as PhoneAppMessage) {
        var _o = Background.getBackgroundData();
        println("old data");
        println(_o);
        if (_o == null) {
            _o = {};
        }
        var d = _o as Dictionary;
        println("got phone app message");
        println(msg.data);
        if (d["phoneAppMessages"] == null) {
            d["phoneAppMessages"] = [];
        }
        d["phoneAppMessages"].add(msg.data);
        println("new data");
        println(d);
        Background.requestApplicationWake("wake up?");
        Background.exit(d);
    }
}