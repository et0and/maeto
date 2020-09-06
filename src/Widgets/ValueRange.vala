namespace Maeto.Widget {

    public class ValueRange : Gtk.Box {

        public signal void changed ();

        //scale object
        private Gtk.Scale scale;

        //current value getter and setter methods
        public int current_value {
            get {
                return (int) scale.get_value ();
            }
            set {
                scale.set_value (value);
            }
        }

        //constructor
        public ValueRange (double min, double max, double step, string? display = null, string? plural = null) {
            //init scale and add it to this
            scale = new Gtk.Scale.with_range (Gtk.Orientation.HORIZONTAL, min, max, step);
            scale.set_hexpand (true);
            add (scale);

            //set optional display string
            if (display != null) {
                scale.format_value.connect ((val) => {
                    if (val == 1) {
                        return "%.0f %s".printf (val, display);
                    }
                    if (plural != null) {
                        return "%.0f %s".printf (val, plural);
                    }
                    return "%.0f".printf (val);
                });
            }

            //connect signals so that the scale updates its value on move
            scale.value_changed.connect (() => {
                current_value = current_value;
                changed ();
            });
        }
    }
}
