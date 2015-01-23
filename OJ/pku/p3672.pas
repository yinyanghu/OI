program p3672;
const maxn=100000;
var m,n,u,f,d,i,ans,total:longint;
    a:array[1..maxn] of longint;
    s:string;
begin
    readln(m,n,u,f,d);
    for i:=1 to n do begin
        readln(s);
	if s='u' then a[i]:=1
	    else if s='f' then a[i]:=2 else a[i]:=3;
    end;
    ans:=0; total:=0;
    while total<=m do begin
        inc(ans);
	case a[ans] of
	    1:total:=total+u+d;
	    2:total:=total+f*2;
	    3:total:=total+d+u;
	end;
    end;
    writeln(ans-1);
end.
