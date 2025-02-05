namespace Multiclock {

    public class HorizBigView : Gtk.Box {

        public Gee.ArrayList<ClockFace> listWidgets;

        public HorizBigView () {
            Object (orientation: Gtk.Orientation.HORIZONTAL, spacing: 1);
        }

        construct{
            listWidgets = new Gee.ArrayList<ClockFace> ();

            var app = GLib.Application.get_default();
            var clockService = (app as Multiclock.Application).clockService;

            // not work operator
//            clockService.listClocks.foreach((e) => {
  //              this.append (new ClockFace(e.town, e.country));
    //            message (e.town + " : " + e.country);
      //      });

            for(int i = 0; i < clockService.listClocks.size; i++) {

                var clock = new ClockFace(clockService.listClocks[i],
                                    clockService.listSvgs.get_string(i));
                clock.visible = clockService.listVisible[i];
                this.append (clock);
                listWidgets.add (clock);
//                this.append (new ClockFace(clockService.listClocks[i],
  //                                  clockService.listSvgs.get_string(i)));
                message (clockService.listClocks[i].town
                    + " : " + clockService.listClocks[i].country);
            }
        }

        public void reset () {

            var app = GLib.Application.get_default();
            var clockService = (app as Multiclock.Application).clockService;

            //this.foreach((e) => { ;});
            for(int i=0; i < listWidgets.size; i++) {
                listWidgets[i].visible = clockService.listVisible[i];
            }
        }
    }
}
