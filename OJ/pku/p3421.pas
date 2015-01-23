program p3421;
const maxn=1048576;
      maxm=20;
var x,k,p,max:longint;
    re,ans:qword;
    w:array[1..maxn] of longint;
    f:array[1..maxm] of qword;
    a:array[1..maxn] of boolean;
procedure init;
 var i,j:longint;
 begin
     fillchar(a,sizeof(a),true);
     i:=2;
     while i<=sqrt(maxn) do begin
         while not a[i] do inc(i);
	 j:=2;
	 while (i*j<=maxn) do begin
	     a[i*j]:=false;
	     inc(j);
	 end;
	 inc(i);
     end;
     j:=0;
     for i:=2 to maxn do
	 if a[i] then begin
	     inc(j); w[j]:=i;
	 end;
     f[1]:=1;
     for i:=2 to maxm do f[i]:=f[i-1]*i;
 end;

begin
    init;
    while not eof do begin
	readln(x);
	if x=0 then begin
	    writeln('0 0');
	    continue;
	end;
	re:=1; max:=0; k:=1;
	while x<>1 do begin
	    while (x mod w[k]<>0) do inc(k);
	    p:=0;
	    while (x mod w[k]=0) do begin
		inc(p);
		x:=x div w[k];
	    end;
	    max:=max+p;
	    re:=re*f[p];
	    inc(k);
	end;
	ans:=f[max] div re;
	writeln(max,' ',ans);
    end;
end.
