class Foo {
    test(){
        print("test");
    }
}

var a = new Object();
a.Foo = Foo;

var f = new a.Foo();
print(f);
f.test();