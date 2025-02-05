namespace Multiclock {

    public class AppsLoadField {
        public const string id = "id";
        public const string application = "application";
        public const string platform = "platform";
        public const string email = "email";
        public const string uid = "uid";
        public const string device = "device";
        public const string locale = "locale";
        public const string datetime = "datetime";
    }

    public class AppsLoadModel {
        public int? id;
        public string application;
        public string platform;
        public string email;
        public string uid;
        public string device;
        public string locale;
        public int64 datetime;

        public AppsLoadModel(string _app, string _platform, string _email, string _uid,
            string _device, string _locale, int64 _datetime) {
            application = _app;
            platform = _platform;
            email = _email;
            uid = _uid;
            device = _device;
            locale = _locale;
            datetime = _datetime;
        }
    }
}
