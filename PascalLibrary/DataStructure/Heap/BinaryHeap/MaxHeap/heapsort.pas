{$inline on}
program heapsort;
const maxn=500000;
var a,s:array[1..maxn] of longint; 
    i,n,total:longint;
function parent(x:longint):longint;inline;
 begin
     exit(x div 2);
 end;

function left(x:longint):longint;inline;
 begin
     exit(x*2);
 end;

function right(x:longint):longint;inline;
 begin
     exit(x*2+1);
 end;

procedure swap(var a,b:longint);inline;
 var k:longint;
 begin
     k:=a; a:=b; b:=k;
 end;

procedure heapify(x:longint);inline; //max
 var l,r,k:longint;
 begin
     l:=left(x); r:=right(x);
     if (l<=total) and (a[l]<a[x]) then k:=l else k:=x;
     if (r<=total) and (a[r]<a[k]) then k:=r;
     if k<>x then begin
	 swap(a[x],a[k]);
	 heapify(k);
     end;
 end;

procedure increase(x,key:longint);inline;
 begin
     if key>a[x] then exit;
     a[x]:=key;
     while (x>1) and (a[parent(x)]>a[x]) do begin
	 swap(a[x],a[parent(x)]);
	 x:=parent(x);
     end;
 end;

procedure insert(key:longint);
 begin
     inc(total);
     a[total]:=maxlongint;
     increase(total,key);
 end;

procedure build;
 var i:longint;
 begin
     total:=n;
     for i:=(n div 2) downto 1 do heapify(i);
 end;

procedure build2;
 var i:longint;
 begin
     total:=1;
     for i:=2 to n do insert(a[i]);
 end;

procedure sort;
 var i:longint;
 begin
     build;
     for i:=n downto 2 do begin
	 swap(a[1],a[i]);
	 dec(total);
	 heapify(1);
     end;
 end;

procedure sort1;
 var i:longint;
 begin
     build2;
     for i:=n downto 2 do begin
	 swap(a[1],a[i]);
	 dec(total);
	 heapify(1);
     end;
 end;

begin
    randomize;
    readln(n);
    for i:=1 to n do s[i]:=random(100)+1;
    a:=s;
    sort;
    for i:=1 to n do write(a[i],'  ');
    writeln('************************************************');
    a:=s;
    sort1;
    for i:=1 to n do write(a[i],'  ');
end.
