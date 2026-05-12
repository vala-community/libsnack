internal class Snack.Service {
	private Snack.Interfaces.HttpClient _http_client;

	public Service (Snack.Settings settings) {
		_http_client = settings.http_client;
	}
}