using Gtk;

namespace Multiclock {

    class ClockWidget : DrawingArea
    {
        private double xCentr;
        private double yCentr;
        //int
        private double radius;

        private int hour = 12;
        private int minute = 15;
        private int second = 30;

        public ClockWidget (int width = 300, int height = 300)
        {
            //var drawing_area = new Gtk.DrawingArea ();
            this.set_size_request (width, height);
            this.set_draw_func (draw_func);
            //return drawing_area;
            //g_timeout_add(1000, update_clock, (gpointer) drawing_area);
            Timeout.add (1000, update_clock);
        }

        private double RADIAN(double x) {
            return ((x * Math.PI/30.0) - Math.PI/2.0);
        }

        private double HOUR(int x) {
            return ((x * 5) % 60);
        }

        private void draw_clock_hand (Cairo.Context context, double center_x, double center_y, double size, double val)
        {
            context.move_to (center_x, center_y);
            context.line_to (center_x + size * Math.cos(RADIAN(val)),
                center_y + size * Math.sin(RADIAN(val)));
            context.stroke ();
        }

        private void draw_func (Gtk.DrawingArea drawing_area, Cairo.Context context, int width, int height)
        {
		    weak Gtk.StyleContext style_context = drawing_area.get_style_context ();
//              GtkStyleContext *context = gtk_widget_get_style_context(widget);

            double center_x = width/2.0;
            double center_y = height/2.0;
	        double radius = double.min (width / 2, height / 2) / 2;
//              gtk_render_background(context, cr, 0, 0, width, height);

            // draw clock arc
            context.arc (center_x, center_y, radius, 0, 2 * Math.PI);

            //  GdkRGBA color;
            //  gtk_style_context_get_color (context, gtk_style_context_get_state (context), &color);
		    Gdk.RGBA color = style_context.get_color ();
            //  gdk_cairo_set_source_rgba (cr, &color);
            Gdk.cairo_set_source_rgba (context, color);
            context.stroke ();

              // draw hour hand
            //  cairo_set_line_width(cr, 2 * cairo_get_line_width(cr));
            context.set_line_width (2 * context.get_line_width());
            draw_clock_hand(context, center_x, center_y, radius/4.0, HOUR(hour));

              // draw minute hand
            //  cairo_set_line_width(cr, 0.5 * cairo_get_line_width(cr));
            context.set_line_width(0.5 * context.get_line_width());
            draw_clock_hand(context, center_x, center_y, radius/2.0, minute);

              // draw second hand
              color.red = 1;
            //  gdk_cairo_set_source_rgba (cr, &color);
            Gdk.cairo_set_source_rgba (context, color);
            draw_clock_hand(context, center_x, center_y, 0.75 * radius, second);
        }

        private void update_time()
        {
//          time_t t = time(NULL);
  //        struct tm *tm_struct = localtime(&t);
    //      hour = tm_struct->tm_hour;
      //    minute = tm_struct->tm_min;
        //  second = tm_struct->tm_sec;
          var now = new DateTime.now_local ();
          hour = (int)Math.round ( now.get_hour ());
          minute = (int)Math.round ( now.get_minute ());
          second = (int)Math.round ( now.get_seconds ());
        }

        private bool update_clock()
        {
          update_time();
          queue_draw();
          return true;
        }
    }
}
