program p2752;
const maxn=400000;
      prime=11;
var f:array[0..maxn] of longint;
    a:array[1..maxn] of longint;
    l,r,n,i,wl,wr:longint;
    ch:char;
begin
    f[0]:=1;
    for i:=1 to maxn do f[i]:=f[i-1]*prime;
    while not eof do begin
        n:=0;
        while not eoln do begin
            read(ch); inc(n); a[n]:=ord(ch);
        end;
        readln;
        wl:=0; wr:=0;
        l:=1; r:=n;
        while l<=n do begin
            wl:=wl*prime+a[l];
            wr:=wr+f[l-1]*a[r];
            if wl=wr then write(l,' ');
            inc(l); dec(r);
        end;
        writeln;
    end;
end.