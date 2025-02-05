namespace Multiclock {

    public abstract class ClockField {
        public const string id = "id";
        public const string country = "country";
        public const string town = "town";
        public const string zone = "zone";
        public const string flag_url = "flag_url";
        public const string hour = "hour";
        public const string minute = "minute";
        public const string second = "second";
        public const string flag_file = "flag_file";
    }

    public class ClockModel {
        public int64 id;
        public string country;
        public string town;
        public string zone;
        public string flag_url;
        public string hour;
        public string minute;
        public string second;
        public string flag_file;

        public ClockModel(int _id, string _country, string _town, string _zone, string _flag_url,
                            string _hour, string _minute, string _second, string _flag_file) {
            id = _id;
            country = _country;
            town = _town;
            zone = _zone;
            flag_url = _flag_url;
            hour = _hour;
            minute = _minute;
            second = _second;
            flag_file = _flag_file;
        }

        public ClockModel.fromJson (Json.Node item) {
//            ClockField clockField = new ClockField();

            Json.Object obj = item.get_object ();
            foreach(unowned string name in obj.get_members ()) {
                switch(name) {
                    case ClockField.id:
                        unowned Json.Node it = obj.get_member (name);
                        id = obj.get_int_member (ClockField.id);
                        message(id.to_string());
                        break;
                    case ClockField.country:
                        unowned Json.Node it = obj.get_member (name);
                        country = obj.get_string_member (ClockField.country);
                        message (country);
                        break;
                    case ClockField.town:
                        unowned Json.Node it = obj.get_member (name);
                        town = obj.get_string_member (ClockField.town);
                        message (town);
                        break;
                    case ClockField.zone:
                        unowned Json.Node it = obj.get_member (name);
                        zone = obj.get_string_member (ClockField.zone);
                        message(zone);
                        break;
                    case ClockField.flag_url:
                        unowned Json.Node it = obj.get_member (name);
                        flag_url = obj.get_string_member (ClockField.flag_url);
                        message(flag_url);
                        break;
                    case ClockField.hour:
                        unowned Json.Node it = obj.get_member (name);
                        hour = obj.get_string_member (ClockField.hour);
                        message(hour);
                        break;
                    case ClockField.minute:
                        unowned Json.Node it = obj.get_member (name);
                        minute = obj.get_string_member (ClockField.minute);
                        message(minute);
                        break;
                    case ClockField.second:
                        unowned Json.Node it = obj.get_member (name);
                        second = obj.get_string_member (ClockField.second);
                        message(second);
                        break;
                    case ClockField.flag_file:
                        unowned Json.Node it = obj.get_member (name);
                        flag_file = obj.get_string_member (ClockField.flag_file);
                        message(flag_file);
                        break;
                    default:
                        break;
                }
            }
        }
    }
}

