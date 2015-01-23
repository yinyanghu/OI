program p1258;
const maxn=100;
var a:array[1..maxn,1..maxn] of longint;
    f:array[1..maxn] of longint;
    flag:array[1..maxn] of boolean;
    i,j,k,min,ans,n:longint;
begin
    while not eof do begin
        readln(n);
        for i:=1 to n do
        	   for j:=1 to n do read(a[i,j]);
        readln;
        ans:=0; f[1]:=0;
        for i:=2 to n do f[i]:=maxlongint;
        fillchar(flag,sizeof(flag),true);
        repeat
            min:=maxlongint; k:=0;
            for i:=1 to n do
                if (f[i]<min) and (flag[i]) then begin
                    min:=f[i]; k:=i;
                end;
            if k=0 then break;
            flag[k]:=false;
            ans:=ans+f[k];
            for i:=1 to n do
                if (i<>k) and (flag[i]) and (a[k,i]<f[i]) then f[i]:=a[k,i];
        until false;
        writeln(ans);
    end;
end.