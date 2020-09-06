namespace Maeto.Managers {

    public class NotificationManager {

        private SoundManager sound;

        //constructor
        public NotificationManager () {
            sound = new SoundManager ();
        }

        public void show_status () {
            string title, body;
            if (saved.status == Status.POMODORO) {
                title = _("Pomodoro Time");
                body = _("Get back to it!");
            } else if (saved.status == Status.SHORT_BREAK) {
                title = _("Short Break");
                body = _(break_messages[break_messages_index]);
            } else {
                title = _("Long Break!");
                body = _(break_messages[break_messages_index]);
            }
            if (Tomato.preferences.pomodoro_sound_enabled) {
                sound.play ();
            }
            show (title, body);
        }

        public void show (string title, string body) {
            var notification = new Notification (title);
            notification.set_body (body);
            var image = new Gtk.Image.from_icon_name ("tomato", Gtk.IconSize.DIALOG);
            notification.set_icon (image.gicon);
            GLib.Application.get_default ().send_notification ("com.github.et0and.maeto", notification);
        }
    }
}
