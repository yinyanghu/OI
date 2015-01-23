program p155;{SGU}
const maxn=50000;
type node=record
	 num,k,a:longint;
     end;
var tree:array[0..maxn] of node;
    p,left,right,pos:array[0..maxn] of longint;
    n,i,rightmost:longint;
procedure sort(l,r:longint);
 var i,j,x:longint;
     y:node;
 begin
     i:=l; j:=r; x:=tree[(l+r) div 2].k;
     repeat
	while tree[i].k<x do inc(i);
	while tree[j].k>x do dec(j);
	if i<=j then begin
	    y:=tree[i]; tree[i]:=tree[j]; tree[j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

procedure rotate(i:longint);
 begin
     while (p[i]<>0) and (tree[i].a<tree[p[i]].a) do begin
	 right[p[i]]:=left[i];
	 if left[i]<>0 then p[left[i]]:=p[i];
	 left[i]:=p[i];
	 if p[i]=left[p[p[i]]] then left[p[p[i]]]:=i else right[p[p[i]]]:=i;
	 p[i]:=p[p[i]];
	 p[left[i]]:=i;
     end;
 end;


begin
    readln(n);
    for i:=1 to n do begin
	tree[i].num:=i;
	readln(tree[i].k,tree[i].a);
    end;
    sort(1,n);
    for i:=1 to n do pos[tree[i].num]:=i;
    rightmost:=1; right[0]:=1;
    for i:=2 to n do begin
	right[rightmost]:=i; p[i]:=rightmost; rightmost:=i;
	rotate(i);
    end;
    writeln('YES');
    for i:=1 to n do writeln(tree[p[pos[i]]].num,' ',tree[left[pos[i]]].num,' ',tree[right[pos[i]]].num);
end.
