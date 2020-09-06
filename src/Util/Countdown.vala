namespace Maeto.Util {

    public class Countdown {

        struct Time {
            int hours;
            int minutes;
            int seconds;
        }

        private int current_time;

        public Countdown () {
            set_current_time (settings.pomodoro_duration * 60);
        }

        public Countdown.with_time (int time) {
            set_current_time (time);
        }

        public int tick () {
            set_current_time (current_time - 1);
            return current_time;
        }

        public int get_current_time () {
            return current_time;
        }

        public void set_current_time (int time) {
            if (time >= 0)
                current_time = time;
        }

        public string get_current_ftime (bool without_hours = true) {
            Time t = parse_time (current_time);
            if (without_hours && t.hours == 0) {
                return "%02d:%02d".printf (t.minutes, t.seconds);
            } return "%02d:%02d:%02d".printf (t.hours, t.minutes, t.seconds);
        }

        public bool is_over () {
            return current_time == 0;
        }

        private Time parse_time (int time) {
            Time t = Time ();
            t.hours = time / 3600;
            time %= 3600;
            t.minutes = time / 60;
            t.seconds = time % 60;
            return t;
        }
    }
}
