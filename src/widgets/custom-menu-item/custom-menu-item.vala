namespace MyLib {
    [GtkTemplate (ui = "/ua/multiapps/multiClock/widgets/custom-menu-item/custom-menu-item.ui")]
    public class CustomMenuItem : Gtk.Widget {
        [GtkChild]
        private unowned Gtk.Label prefix;
        [GtkChild]
        private unowned Gtk.Label sufix;
        [GtkChild]
        private unowned Gtk.Button clickbutton;

        public CustomMenuItem () {
            Object ();
        }

        construct {
            this.set_layout_manager (new Gtk.BinLayout ());
//            clickbutton.add_css_class("light");
        }

        public Gtk.Button button {
            get {
                return clickbutton;
            }
        }

        public string pref {
            set {
                prefix.set_label (value);
            }
        }

        public string suf {
            set {
                sufix.set_label (value);
            }
        }
    }
}
