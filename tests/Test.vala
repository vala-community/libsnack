void add_foo_tests () {
    Test.add_func (@"$(Snack.Constants.OBJECT_PATH)/test", () => {
        var client = new Snack.Client ();
        assert (client.foo () == "foo!");
    });
}

void main (string[] args) {
    Test.init (ref args);
    add_foo_tests ();
    Test.run ();
}
