namespace Snack {
	private static Snack.Settings _settings;
	private static GLib.Once<Snack.Service> _service_instance;
	
	public static void load_settings (Snack.Settings settings) {
		_settings = settings;
	}

	public static void service_instance () {
		_service_instance.once (() => { return new Snack.Service (_settings ?? load_default_settings ()); });
	}

	private static Snack.Settings load_default_settings () {
		_settings = new Snack.Settings () {
			http_client = new Snack.Adapters.LibSoup3HttpClient ()
		};
		return _settings;
	}
}