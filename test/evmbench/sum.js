n = 30000000
t1 = clock();
ts = 0
for(var i=0; i < n; i++){
    ts += sum(1, 1000);
}
t2 = clock();

t = 1000 * (t2 - t1);

ctt = 1000 * ts;
print("func call times: " + n.toString())
print("c func call : " + ctt.toString() + " ms");
print("total call :" + t.toString() + " ms");
print(t - ctt);

