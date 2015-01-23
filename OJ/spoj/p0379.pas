program p0379;
var a,s:array[1..100000] of longint;
    i,k,n,p:longint;
    ok:boolean;
begin
    readln(n);
    while n<>0 do begin
        for i:=1 to n do begin
            read(k);
            a[k]:=i;
            s[i]:=k;
        end;
        ok:=true;
        for i:=1 to n do begin
            p:=a[i];
            if p<>s[i] then begin
                ok:=false;
                break;
            end;
        end;
        if ok then writeln('ambiguous')
            else writeln('not ambiguous');
        readln(n);
    end;
end.
{var i,n,t:longint;
    s,ans:ansistring;
    ok:boolean;
    ch:char;
begin
    readln(n);
    while n<>0 do begin
        readln(s);
        while pos(' ',s)<>0 do delete(s,pos(' ',s),1);
        ans:=''; ok:=true;
        for i:=1 to n do begin
            ch:=chr(i+48);
            ans:=ans+chr(pos(ch,s)+48);
            if ans[i]<>s[i] then begin
                ok:=false;
                break;
            end;
        end;
        if ok then writeln('ambiguous')
            else writeln('not ambiguous');
        readln(n);
    end;
end.}
