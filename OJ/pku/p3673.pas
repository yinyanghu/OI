program p3673;
const maxl=10;
var a,b:array[1..maxl] of longint;
    ans,la,lb,i,j,k:longint;
    s:string;
begin
    readln(s);
    k:=pos(' ',s);
    la:=0;
    for i:=1 to k-1 do begin
        inc(la); a[la]:=ord(s[i])-48;
    end;
    lb:=0;
    for i:=k+1 to length(s) do begin
        inc(lb); b[lb]:=ord(s[i])-48;
    end;
    ans:=0;
    for i:=1 to la do
	for j:=1 to lb do ans:=ans+a[i]*b[j];
    writeln(ans);
end.
