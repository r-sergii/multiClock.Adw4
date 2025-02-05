using Gtk;

namespace Multiclock {

    public class ClockFace : DrawingArea {

        private string _town;
        public string town {
            set { _town = value; }
        }

        private string _country;
        public string country {
            set { _country = value; }
        }

        private string _svg;
        private string _hour;
        private string _minute;
        private string _second;
        private Gdk.Pixbuf pixbuf;
        private Adw.ColorScheme theme;
        private int hourDifference;

        private Time time;
        private int minute_offset;
        private bool dragging;

        public signal void time_changed (int hour, int minute);

        public ClockFace (Multiclock.ClockModel model, string __svg)
            {
            _town = model.town;
            _country = model.country;
            _hour = model.hour;
            _minute = model.minute;
            _second = model.second;
            _svg = __svg;
            pixbuf = new Gdk.Pixbuf.from_resource ( _svg ); //96, 96, true);

            //set differnce hour between local time & time in selected cities
            var localTime = Time.local (time_t ());
            hourDifference = localTime.hour - int.parse(model.hour);

//            var app = GLib.Application.get_default();
  //          var clockService = (app as Multiclock.Application).clockService;
    //        theme = (app as Multiclock.Application).theme;

            this.set_size_request (300, 300);
            this.set_draw_func (draw_func);
            update ();

            // update the clock once a second
            Timeout.add (1000, update);
        }

//        public override bool draw (Cairo.Context cr) {
        private void draw_func (Gtk.DrawingArea drawing_area, Cairo.Context cr, int width, int height)
        {
            var app = GLib.Application.get_default();
            var clockService = (app as Multiclock.Application).clockService;
            theme = (app as Multiclock.Application).theme;
//            var x = get_allocated_width () / 2;
  //          var y = get_allocated_height () / 2;
    //        var radius = double.min (get_allocated_width () / 2,
      //                               get_allocated_height () / 2) - 5;
            var x = width / 2;
            var y = height / 2;
            var radius = double.min (width / 2,
                                     height / 2) - 5;

            // clock back
            cr.arc (x, y, radius, 0, 2 * Math.PI);
            ////cr.set_source_rgb (1, 1, 1);
            if((theme == Adw.ColorScheme.FORCE_LIGHT) || (theme == Adw.ColorScheme.PREFER_LIGHT)) {
                cr.set_source_rgb (0.95, 0.95, 0.95);
            } else {
                cr.set_source_rgb (0.15, 0.15, 0.15);
            }

            cr.fill_preserve ();
//            cr.set_source_rgb (0, 0, 0);
            if((theme == Adw.ColorScheme.FORCE_LIGHT) || (theme == Adw.ColorScheme.PREFER_LIGHT)) {
                cr.set_source_rgb (0, 0, 0);
            } else {
                cr.set_source_rgb (1, 1, 1);
            }
            cr.stroke ();

            // clock show flag
            Gdk.cairo_set_source_pixbuf(cr, pixbuf, x - 100, y - 100);
            cr.rectangle ( x - 110, y - 110,pixbuf.get_width() + 20, pixbuf.get_height() + 20);
            cr.fill();

            if((theme == Adw.ColorScheme.FORCE_LIGHT) || (theme == Adw.ColorScheme.PREFER_LIGHT)) {
                cr.set_source_rgb (0.1, 0.1, 0.1);
            } else {
                cr.set_source_rgb (0.9, 0.9, 0.9);
            }

            // clock show name town
//    	    cr.set_source_rgb (0.1, 0.1, 0.1);
    	    cr.select_font_face ("Adventure", Cairo.FontSlant.NORMAL, Cairo.FontWeight.BOLD);
    	    cr.set_font_size (14);
    	    cr.move_to (x, y + radius / 3);
    	    cr.show_text (_town);

            // clock show name countru
//    	    cr.set_source_rgb (0.1, 0.1, 0.1);
    	    cr.select_font_face ("Adventure", Cairo.FontSlant.NORMAL, Cairo.FontWeight.BOLD);
    	    cr.set_font_size (12);
    	    cr.move_to (x, y + radius / 3 * 1.6);
    	    cr.show_text (MyLib.TextOperation.TextTrim(_country,16));

            // clock show flag
//            Gdk.cairo_set_source_pixbuf(cr, pixbuf, x - 100, y - 100);
  //          cr.rectangle ( x - 110, y - 110,pixbuf.get_width() + 20, pixbuf.get_height() + 20);
    //        cr.fill();

            // clock ticks
            for (int i = 0; i < 12; i++) {
                int inset;

                cr.save ();     // stack pen-size

                if (i % 3 == 0) {
                    inset = (int) (0.2 * radius);
                } else {
                    inset = (int) (0.1 * radius);
                    cr.set_line_width (0.5 * cr.get_line_width ());
                }

                cr.move_to (x + (radius - inset) * Math.cos (i * Math.PI / 6),
                            y + (radius - inset) * Math.sin (i * Math.PI / 6));
                cr.line_to (x + radius * Math.cos (i * Math.PI / 6),
                            y + radius * Math.sin (i * Math.PI / 6));
                cr.stroke ();
                cr.restore ();  // stack pen-size
            }

            // clock hands

            var hours = this.time.hour;
            var minutes = this.time.minute + this.minute_offset;
            var seconds = this.time.second;

            // hour hand:
            // the hour hand is rotated 30 degrees (pi/6 r) per hour +
            // 1/2 a degree (pi/360 r) per minute
            cr.save ();
            cr.set_line_width (2.5 * cr.get_line_width ());
            cr.move_to (x, y);
            cr.line_to (x + radius / 2 * Math.sin (Math.PI / 6 * hours
                                                 + Math.PI / 360 * minutes),
                        y + radius / 2 * -Math.cos (Math.PI / 6 * hours
                                                  + Math.PI / 360 * minutes));
            cr.stroke ();
            cr.restore ();

            // minute hand:
            // the minute hand is rotated 6 degrees (pi/30 r) per minute
            cr.move_to (x, y);
            cr.line_to (x + radius * 0.75 * Math.sin (Math.PI / 30 * minutes),
                        y + radius * 0.75 * -Math.cos (Math.PI / 30 * minutes));
            cr.stroke ();

            // seconds hand:
            // operates identically to the minute hand
            cr.save ();
            cr.set_source_rgb (1, 0, 0); // red
            cr.move_to (x, y);
            cr.line_to (x + radius * 0.7 * Math.sin (Math.PI / 30 * seconds),
                        y + radius * 0.7 * -Math.cos (Math.PI / 30 * seconds));
            cr.stroke ();
            cr.restore ();

            //return false;
            //Gdk.cairo_set_source_pixbuf(cr, pixbuf, x, y);
            // // clock show flag
//            Gdk.cairo_set_source_pixbuf(cr, pixbuf, x - 100, y + 10);
  //          cr.rectangle ( x - 110, y + 20, pixbuf.get_width() + 20, pixbuf.get_height() + 20);
    //        cr.fill();

        }

        private void emit_time_changed_signal (int x, int y) {
            // decode the minute hand
            // normalise the coordinates around the origin
            x -= this.get_allocated_width () / 2;
            y -= this.get_allocated_height () / 2;

            // phi is a bearing from north clockwise, use the same geometry as
            // we did to position the minute hand originally
            var phi = Math.atan2 (x, -y);
            if (phi < 0) {
                phi += Math.PI * 2;
            }

            var hour = this.time.hour;
            var minute = (int) (phi * 30 / Math.PI);

            // update the offset
            this.minute_offset = minute - this.time.minute;
            redraw_canvas ();

            time_changed (hour, minute);
        }

        private bool update () {
            // update the time
            // simple method
//            this.time = Time.local (time_t ());
  //          this.time.hour = int.parse(_hour);

            // correcting method for longli use
//            message (hourDifference.to_string ());
            var dateNow = new GLib.DateTime.now ();
//            message (dateNow.get_hour().to_string ());
            dateNow = dateNow.add_hours (-hourDifference);
//            message (dateNow.get_hour().to_string ());
            this.time = Time.local (time_t ());
            this.time.hour = dateNow.get_hour();

            redraw_canvas ();
            return true;        // keep running this event
        }

        private void redraw_canvas () {
            queue_draw ();
        }

    }

}

