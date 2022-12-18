import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.AntPlus;

class TestWatchFaceView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Get and show the current time
        var clockTime = System.getClockTime();
        var systemStats = System.getSystemStats();

        var batteryString = Lang.format("$1$%", [systemStats.battery.format("%2.0f")]);
        var hoursString = Lang.format("$1$", [clockTime.hour.format("%02d")]);
        var minutesString = Lang.format("$1$", [clockTime.min.format("%02d")]);

        var batteryView = View.findDrawableById("battery") as Text;
        var hoursView = View.findDrawableById("time_hours") as Text;
        var minutesView = View.findDrawableById("time_minutes") as Text;

        batteryView.setText(batteryString);
        hoursView.setText(hoursString);
        minutesView.setText(minutesString);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}
