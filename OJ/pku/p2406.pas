program p2406;
const maxn=1000000;
var w:array[1..maxn] of longint;
    s:ansistring;
    len,i,k,ans:longint;
begin
    readln(s);
    while s<>'.' do begin
        len:=length(s);
        k:=0; w[1]:=0;
        for i:=2 to len do begin
            while (k>0) and (s[k+1]<>s[i]) do k:=w[k];
            if s[k+1]=s[i] then inc(k);
            w[i]:=k;
        end;
        ans:=len-w[len];
        if (len mod ans=0) then ans:=len div ans else ans:=1;
        writeln(ans);
        readln(s);
    end;
end.