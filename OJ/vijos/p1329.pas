program p1329;
var a:array[0..1,0..100000] of boolean;
    b,c:array[0..40] of longint;
    i,j,k,p,n,m,t:longint;
    ch:char;
begin
    readln(n,m);
    for i:=1 to n do begin
        read(ch);
        if ch='b' then a[0,i]:=true else a[0,i]:=false;
    end;
    k:=m; p:=0; t:=0;
    while k>0 do begin
        inc(p);
	b[p]:=k mod 2;
	k:=k div 2;
    end;
    for i:=1 to p do begin
        if i=1 then c[i]:=1 else c[i]:=c[i-1]*2;
	if b[i]=1 then begin
            t:=1-t;
            for j:=1 to n do
               a[t,j]:=a[1-t,j] xor a[1-t,((j-c[i]) mod n+n-1) mod n+1];
        end;
    end;
    for i:=1 to n do
       if not a[t,i] then write('d') else write('b');
end.