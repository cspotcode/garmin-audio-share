import Toybox.Lang;
import Toybox.System;
import Toybox.Media;

class AudioShareContentIterator extends Media.ContentIterator {

    function initialize() {
        ContentIterator.initialize();
    }

    // Determine if the the current track can be skipped.
    function canSkip() as Boolean {
        return false;
    }

    // Get the current media content object.
    function get() as Content? {
        System.println("ContentIterator get()");
        // var ref = new ContentRef(10, CONTENT_TYPE_AUDIO);
        // var meta = new ContentMetadata();
        // var c = new Content(ref, meta);
        // return c;
        return null;
        // throw new MyException();
    }

    // Get the current media content playback profile
    function getPlaybackProfile() as PlaybackProfile? {
        System.println("ContentIterator getPlaybackProfile()");
        var profile = new Media.PlaybackProfile();
        profile.attemptSkipAfterThumbsDown = false;
        profile.playbackControls = [
            PLAYBACK_CONTROL_SKIP_BACKWARD,
            PLAYBACK_CONTROL_PLAYBACK,
            PLAYBACK_CONTROL_SKIP_FORWARD,
            PLAYBACK_CONTROL_LIBRARY,
            PLAYBACK_CONTROL_SOURCE
        ] as Array<PlaybackControl or CustomButton or SystemButton>;
        profile.playbackNotificationThreshold = 1;
        profile.requirePlaybackNotification = false;
        profile.skipPreviousThreshold = null;
        return profile;
    }

    // Get the next media content object.
    function next() as Content? {
        return null;
    }

    // Get the next media content object without incrementing the iterator.
    function peekNext() as Content? {
        return null;
    }

    // Get the previous media content object without decrementing the iterator.
    function peekPrevious() as Content? {
        return null;
    }

    // Get the previous media content object.
    function previous() as Content? {
        return null;
    }

    // Determine if playback is currently set to shuffle.
    function shuffling() as Boolean {
        return false;
    }

}
