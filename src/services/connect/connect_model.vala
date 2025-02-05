namespace Multiclock {

    public abstract class ConnectField {
        public const string mes = "message";
    }

    public class ConnectModel {
        public string mes;

        public ConnectModel(string _message) {
            mes = _message;
        }

        public ConnectModel.fromJson (Json.Node item) {
//            ConnectField connectField = new ConnectField();

            Json.Object obj = item.get_object ();
            foreach(unowned string name in obj.get_members ()) {
                switch(name) {
                    case ConnectField.mes:
                        unowned Json.Node it = obj.get_member (name);
                        mes = obj.get_string_member (ConnectField.mes);
                        message (mes);
                        break;
                    default:
                        break;
                }
            }
        }
    }
}

