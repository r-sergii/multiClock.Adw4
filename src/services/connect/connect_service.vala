namespace Multiclock {

    public class ConnectService {
        public Gee.ArrayList<ConnectModel> listConnects;
        private ConnectProvider connectProvider;

        public ConnectService() {
            connectProvider = new ConnectProvider ();
            listConnects = new Gee.ArrayList<ConnectModel> ();
        }

        public bool connect() {
            return connectProvider.connect( listConnects );
        }
    }
}

