program box;   {h(i,k)=h(i-1,k-m[i]) or h(i-1,k)}
var i,k,n,v:integer;
    m:array[1..30] of integer;
    h:array[0..20000] of boolean;
begin
    assign(input,'box.in'); reset(input);
    readln(v,n);
    for i:=1 to n do read(m[i]);
    close(input);
    fillchar(h,sizeof(h),false);
    h[0]:=true;
    for i:=1 to n do
      for k:=v downto m[i] do
        h[k]:=h[k] or h[k-m[i]];
    k:=v;
    while (k>0) and (not h[k]) do dec(k);
    assign(output,'box.out'); rewrite(output);
    writeln(v-k);
    close(output);
end.