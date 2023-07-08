import Toybox.Application;
import Toybox.Communications;
import Toybox.Background;
import Toybox.Lang;
import Toybox.Media;
import Toybox.WatchUi;
import Toybox.System;

(:background)
class AudioShareApp extends Application.AudioContentProviderApp {

    function initialize() {
        AudioContentProviderApp.initialize();
        Background.registerForPhoneAppMessageEvent();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Get a Media.ContentDelegate for use by the system to get and iterate through media on the device
    function getContentDelegate(arg as PersistableType) as ContentDelegate? {
        return new AudioShareContentDelegate();
    }

    // Get a delegate that communicates sync status to the system for syncing media content to the device
    function getSyncDelegate() as Communications.SyncDelegate? {
        return new AudioShareSyncDelegate();
    }

    // Get the initial view for configuring playback
    function getPlaybackConfigurationView() as Array<Views or InputDelegates>? {
        return [ new AudioShareConfigurePlaybackView(), new AudioShareConfigurePlaybackDelegate() ] as Array<Views or InputDelegates>;
    }

    // Get the initial view for configuring sync
    function getSyncConfigurationView() as Array<Views or InputDelegates>? {
        return [ new AudioShareConfigureSyncView(), new AudioShareConfigureSyncDelegate() ] as Array<Views or InputDelegates>;
    }

    function getServiceDelegate() as Array<ServiceDelegate> {
        return [new AudioShareServiceDelegate()];
    }

    function onBackgroundData(data) {
        System.println("Foreground received background data");
        System.println(data);
    }

}

function getApp() as AudioShareApp {
    return Application.getApp() as AudioShareApp;
}