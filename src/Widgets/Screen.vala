namespace Maeto.Widget {

    public class Screen : Gtk.Frame {

        private Gtk.Box elements;
        private Gtk.Box progress_box;
        private Gtk.ButtonBox control_box;

        public Screen (string name) {
            this.name = name;

            elements = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
            progress_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
            control_box = new Gtk.ButtonBox (Gtk.Orientation.HORIZONTAL);

            setup_control_box ();
            setup_elements ();

            add (elements);
            set_shadow_type (Gtk.ShadowType.NONE);
        }

        public string get_name () {
            return name;
        }

        public void add_progress (Gtk.Label countdown, Gtk.Label total_time) {
            clear_progress (countdown);
            progress_box.pack_start (countdown);
            countdown.show ();

            clear_progress (total_time);
            progress_box.pack_start (total_time);
            total_time.show ();
        }

        public void add_control (Gtk.Widget control) {
            control_box.add (control);
        }

        public void add_controls (Gtk.Widget[] controls) {
            foreach (Gtk.Widget control in controls) {
				add_control (control);
            }
        }

        private void clear_progress (Gtk.Label progress) {
            var progress_parent = progress.get_parent ();
            if (progress_parent != null) {
                progress_parent.remove (progress);
            }
        }

        private void setup_elements () {
            elements.set_border_width (1);
            elements.pack_start (progress_box);
            elements.pack_start (control_box);
        }

        private void setup_control_box () {
            control_box.set_layout (Gtk.ButtonBoxStyle.CENTER);
            control_box.set_spacing (6);
			control_box.set_valign (Gtk.Align.END);
            control_box.set_margin_bottom (15);
        }
    }
}
