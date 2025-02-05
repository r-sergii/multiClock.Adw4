namespace Multiclock {

    class ConnectProvider {
//        const string baseUrl = "www.google.com";
        const string baseUrl = "https://multiapps-seven.vercel.app";

        Http.Client http;

        public ConnectProvider() {
            http = new Http.Client();
        }

        public bool connect ( Gee.ArrayList<ConnectModel> listConnects ) {
            var host = baseUrl;

            try {
                var response = http.get( host );
                if ( response.status.code == 200 ){
                    //stdout.printf(@"My public IP address is: $(response)\n");
                    message (response.to_string ());

                    var parser = new Json.Parser ();
                    parser.load_from_data ("["+(string)response.to_string ()+"]", -1);

                    unowned Json.Node node = parser.get_root();
                    unowned Json.Array arr = node.get_array();
                    int i = 0;
                    foreach(unowned Json.Node item in arr.get_elements ()) {
                        listConnects.add (new ConnectModel.fromJson (item) );

                        i++;
                        message(i.to_string());
                    }

                    return true;
                }
                return false;
            } catch (Error err){

                stderr.printf(@"$(err.message)\n");
                return false;
            }
        }
    }
}

