program p2008;
const maxn=1000;
      maxlen=100000;
type node=record
	 h,w,key:longint;
     end;
var s,temp:array[1..maxn] of node;
    w:array[1..maxn] of longint;
    tree:array[1..maxlen] of longint;
    flag:array[1..maxn] of boolean;
    n,max,i,j,a,b,c,total,ans,minh,minw,cur,value:longint;
procedure sort(l,r:longint);
 var i,j,x:longint;
     y:node;
 begin
     i:=l; j:=r; x:=temp[(l+r) shr 1].key;
     repeat
        while (temp[i].key<x) do inc(i);
	while (temp[j].key>x) do dec(j);
	if i<=j then begin
	    y:=temp[i]; temp[i]:=temp[j]; temp[j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

procedure wsort(l,r:longint);
 var i,j,x,y:longint;
 begin
     i:=l; j:=r; x:=w[(l+r) shr 1];
     repeat
	while w[i]<x do inc(i);
	while w[j]>x do dec(j);
	if i<=j then begin
	    y:=w[i]; w[i]:=w[j]; w[j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then wsort(l,j);
     if i<r then wsort(i,r);
 end;

function lowbit(x:longint):longint;
 begin
     lowbit:=x and (x xor (x-1));
 end;

procedure modify(k:longint);
 begin
     while k<=w[n] do begin
         inc(tree[k]);
	 k:=k+lowbit(k);
     end;
 end;

function getsum(k:longint):longint;
 var sum:longint;
 begin
     sum:=0;
     while k>0 do begin
         sum:=sum+tree[k];
	 k:=k-lowbit(k);
     end;
     getsum:=sum;
 end;

begin
    readln(n);
    readln(a,b,c);
    for i:=1 to n do begin
        readln(s[i].h,s[i].w);
	w[i]:=s[i].w;
	s[i].key:=a*s[i].h+b*s[i].w;
    end;
    max:=-1;
    wsort(1,n);
    fillchar(flag,sizeof(flag),true);
    for i:=2 to n do
	if w[i]=w[i-1] then flag[i]:=false;
    for i:=1 to n do begin
        minh:=s[i].h; total:=0;
	fillchar(tree,sizeof(tree),0);
	for j:=1 to n do
	    if s[j].h>=minh then begin
	        inc(total);
	        temp[total]:=s[j];
	    end;
	if total=0 then continue;
	sort(1,total);
	cur:=1;
	for j:=1 to n do if (flag[j]) then begin
	    minw:=w[j]; value:=c+a*minh+b*minw;
	    while (cur<=total) and (temp[cur].key<=value) do begin
	        modify(temp[cur].w);
	        inc(cur);
	    end;
            ans:=cur-1-getsum(minw-1);
	    if ans>max then max:=ans;
	end;
    end;
    writeln(max);
end.
