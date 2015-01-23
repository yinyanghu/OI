program p0328;
var a:array[1..110] of longint;
    i,k,l,n,p:longint;
    s:string;
begin
    while not eof do begin
        readln(s);
        fillchar(a,sizeof(a),0);
        if s='1' then begin
            writeln(1);
            continue;
        end;
        l:=length(s);
        for i:=1 to l do a[i]:=ord(s[l-i+1])-48;
        dec(a[1]);
        p:=1;
        while a[p]=-1 do begin
            dec(a[p+1]);
            a[p]:=9;
            inc(p);
        end;
        k:=0;
        for i:=1 to l+10 do begin
            a[i]:=a[i]*2+k;
            k:=a[i] div 10;
            a[i]:=a[i] mod 10;
        end;
        l:=l+10;
        while a[l]=0 do dec(l);
        for i:=l downto 1 do write(a[i]);
        writeln;
    end;
end.
