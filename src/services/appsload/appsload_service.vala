namespace Multiclock {

    public class AppsLoadService {
        public AppsLoadModel model;
        private AppsLoadProvider appsLoadProvider;
        private MyLib.InfoLinux info;

        public AppsLoadService(MyLib.InfoLinux _info, string locale) {
            info = _info;
            var date = new GLib.DateTime.now ();
            appsLoadProvider = new AppsLoadProvider ();
            model = new AppsLoadModel (
                "mClock", //application :
                "flatpak", //platform:
                "", //email:
                "", //uid:
                info.os + "-" + info.cpu, //device:
                locale, //locale:
                date.to_unix () //datetime:
            );
        }

        public void insert() {
            appsLoadProvider.insertItem( model );
        }
    }
}
