n = 100000
t1 = clock();
ts = []
for(var i=0; i < n; i++){
    ts.push(sum(1, 1000));
}
t2 = clock();

t = 1000 * (t2 - t1);

ct = 0;
for(var i=0; i < ts.length; i++){
    ct += ts[i];
}
ctt = 1000 * ct;
print("func call times: " + n.toString())
print("c func call : " + ctt.toString() + " ms");
print("total call :" + t.toString() + " ms");
print(t - ctt);

