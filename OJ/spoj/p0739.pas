program p0739;
const ch:string[2]='01';
      m=-2;
var i,j,n,k:longint;
    s:array[0..500] of longint;

begin
    readln(n);
    i:=0; k:=n;
    while (k<0) or (k>=-m) do begin
        s[i]:=k mod m;
        k:=k div m;
        if s[i]<0 then begin
            s[i]:=s[i]-m;
            k:=k+1;
        end;
        inc(i);
    end;
    s[i]:=k;
    for j:=i downto 0 do write(ch[s[j]+1]);
    writeln;
end.