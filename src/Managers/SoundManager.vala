namespace Maeto.Managers {

    public class SoundManager {

        private Canberra.Context? player;
        private string sound_id;

        public SoundManager () {
            this.with_custom_sound ("complete");
        }

        public SoundManager.with_custom_sound (string sound_id) {
            if (Canberra.Context.create (out player) < 0) {
                warning ("Sound will not be available");
                player = null;
            }

            this.sound_id = sound_id;
        }

        public void play () {
            if (player != null) {
                player.play (1, Canberra.PROP_EVENT_ID, sound_id,
                                Canberra.PROP_MEDIA_ROLE, "alarm");
            }
        }
    }
}
