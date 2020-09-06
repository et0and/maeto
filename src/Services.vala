namespace Maeto.Services {

    public class SavedState : Granite.Services.Settings {
        public string date {get; set;}
        public Status status {get; set;}
        public int countdown {get; set;}
        public int total_time {get; set;}
        public int pomodoro_count {get; set;}

        public bool is_date_today () {
            var dt = new DateTime.now_local ();
            return date == dt.format ("%Y-%m-%d");
        }

        public void update_date () {
            date = (new DateTime.now_local ()).format ("%Y-%m-%d");
        }

        public SavedState () {
            base ("com.github.et0and.maeto.saved");
        }
    }

    public class Settings : Granite.Services.Settings {
        public int pomodoro_duration {get; set;}
        public int short_break_duration {get; set;}
        public int long_break_duration {get; set;}
        public int long_break_delay {get; set;}

        public Settings () {
            base ("com.github.et0and.maeto.settings");
        }
    }

    public class Preferences : Granite.Services.Settings {
        public bool reset_work_everyday {get; set;}
        public bool pause_after_break {get; set;}
        public bool auto_stop {get; set;}
        public bool pomodoro_sound_enabled {get; set;}
        public bool notifications_blocked {get; set;}
        public bool debug_mode {get; set;}

        public Preferences () {
            base ("com.github.et0and.maeto.preferences");
        }
    }
}
