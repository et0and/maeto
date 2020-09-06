namespace Maeto.Managers {

    public class LauncherManager {

        private Unity.LauncherEntry launcher;

        public LauncherManager () {
            launcher = Unity.LauncherEntry.get_for_desktop_id ("com.github.tomatoers.tomato.desktop");
            update_progress ();
        }


        public void update_progress () {
            double duration;
            if (saved.status == Status.SHORT_BREAK) {
                duration = settings.short_break_duration * 60.0;
            }
            else if (saved.status == Status.LONG_BREAK) {
                duration = settings.long_break_duration * 60.0;
            }
            else {
                duration = settings.pomodoro_duration * 60.0;
            }

            launcher.progress = 1 - work.raw_countdown () / duration;
        }

        public bool has_progress () {
            return launcher.progress != 0;
        }

        public void show_progress () {
            launcher.progress_visible = true;
        }

        public void hide_progress () {
            launcher.progress_visible = false;
        }

    }
}
