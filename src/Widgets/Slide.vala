namespace Maeto.Widget {

    public class Slide : Gtk.Stack {

        private List<Screen> screens;

		public signal void changed (Screen s);

        public Slide () {
            screens = new List<Screen> ();
            set_transition_duration (500);
			this.expand = true;
        }

        public void add_screen (Screen screen) {
            add_named (screen, screen.get_name ());
            screens.append (screen);
        }

        public void set_visible_screen (string name, Gtk.StackTransitionType transition = Gtk.StackTransitionType.SLIDE_LEFT) {
            set_visible_child_full (name, transition);
			message (name);
			changed (find_screen (name));
        }

        public Screen? get_visible_screen () {
            return find_screen (get_visible_child_name ());
        }

        public Screen? find_screen (string name) {
            for (uint i = 0; i < screens.length (); i++) {
                if (screens.nth_data (i).get_name () == name)
                    return screens.nth_data (i);
            } return null;
        }
    }
}
