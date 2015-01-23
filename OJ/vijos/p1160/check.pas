program check;
const maxn=300000;
var a:array[1..maxn] of longint;
    i,j,k,total,n,l,b,p:longint;
function pp(s,t:longint):longint;
 var i,j,m,x:longint;
 begin
     i:=s; j:=t; x:=a[i];
     repeat
        while (a[j]>=x) and (j>i) do dec(j);
        if j>i then begin m:=a[i]; a[i]:=a[j]; a[j]:=m; end;
        while (a[i]<=x) and (i<j) do inc(i);
        if i<j then begin m:=a[j]; a[j]:=a[i]; a[i]:=m; end;
     until i=j;
     a[i]:=x;
     pp:=i;
 end;

function find(s,t,k:longint):longint;
 var m,q:longint;
 begin
     if s=t then exit(a[s]);
     m:=pp(s,t);
     q:=m-s+1;
     if k<=q then find:=find(s,m,k) else find:=find(m+1,t,k-q);
 end;

begin
    assign(input,'test.in'); reset(input);
    assign(output,'check.out'); rewrite(output);
    readln(n); total:=1; a[1]:=maxlongint;
    for i:=1 to n do begin
	readln(p,b);
        if p>total then p:=total;
        if p=1 then begin
	    inc(total);
            a[total]:=b;
	    writeln('facer');
        end else begin
	    l:=find(1,total,total-p+1);
            if l>b then begin
		inc(total);
		a[total]:=b;
		writeln('facer');
            end else begin
		writeln('archer');
		for j:=1 to total do
		   if a[j]=l then break;
		k:=a[j]; a[j]:=a[total]; a[total]:=k;
		dec(total);
	    end;
	end;
    end;
    close(input);
    close(output);
end.
