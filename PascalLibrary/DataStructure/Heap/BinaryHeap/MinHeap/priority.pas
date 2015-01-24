{$inline on}
program priorityqueue;
const maxn=10000;
var a:array[1..maxn] of longint; 
    n,total:longint;
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

procedure heapify(x:longint);inline; //min
 var l,r,k:longint;
 begin
     l:=left(x); r:=right(x);
     if (l<=total) and (a[l]>a[x]) then k:=l else k:=x;
     if (r<=total) and (a[r]>a[k]) then k:=r;
     if k<>x then begin
	 swap(a[x],a[k]);
	 heapify(k);
     end;
 end;

procedure increase(x,key:longint);inline;
 begin
     if key<a[x] then exit;
     a[x]:=key;
     while (x>1) and (a[parent(x)]<a[x]) do begin
	 swap(a[x],a[parent(x)]);
	 x:=parent(x);
     end;
 end;

procedure insert(key:longint);
 begin
     inc(total);
     a[total]:=-maxlongint;
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

function minimum:longint;
 begin
     exit(a[1]);
 end;

function extract:longint;
 var min:longint;
 begin
     min:=a[1];
     a[1]:=a[total];
     dec(total);
     heapify(1);
     extract:=min;
 end;


begin

end.
