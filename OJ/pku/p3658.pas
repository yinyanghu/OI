program p3658;
const maxn=100001;
      infinity=1000000000;
var w,h:array[0..maxn] of int64;
    prev,next:array[1..maxn] of longint;
    ans:array[0..maxn] of int64;
    n,level,i:longint;
    total:int64;
begin
    readln(n);
    h[0]:=infinity; h[n+1]:=infinity;
    level:=1;
    for i:=1 to n do begin
        readln(w[i],h[i]);
	prev[i]:=i-1; next[i]:=i+1;
	if h[i]<h[level] then level:=i;
    end;
    total:=0;
    while h[level]<infinity do begin
        ans[level]:=total+w[level];
	next[prev[level]]:=next[level];
	prev[next[level]]:=prev[level];
	if h[prev[level]]<h[next[level]] then begin
	    total:=total+w[level]*(h[prev[level]]-h[level]);
	    inc(w[prev[level]],w[level]);
	    level:=prev[level];
	    while (level>0) and (h[prev[level]]<h[level]) do level:=prev[level];
	end else begin
	    total:=total+w[level]*(h[next[level]]-h[level]);
	    inc(w[next[level]],w[level]);
	    level:=next[level];
	    while (level<=n) and (h[next[level]]<h[level]) do level:=next[level];
	end;
    end;
    for i:=1 to n do writeln(ans[i]);
end.
    