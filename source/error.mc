import Toybox.Lang;

class MyException extends Lang.Exception {
    function initialize() {
        Exception.initialize();
    }
    function toString() {
        return "Error message here";
    }
}