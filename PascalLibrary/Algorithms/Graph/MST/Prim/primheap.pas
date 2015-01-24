program prim;
const
	maxn=100;
type
	node=record
		dist,num:longint;
	end;
var
	f:array[1..maxn] of longint;
	heap:array[1..maxn] of node;
	w:array[1..maxn,1..maxn] of longint;
	s:array[1..maxn] of boolean;
	i,j,k,m,n,total,x,y,ans:longint;

procedure insert(var p:longint; s,v:longint);
 var
 	t:longint;
	k:node;
 begin
	 inc(p);
	 t:=p;
	 heap[t].dist:=s; heap[t].num:=v;
	 while (t <> 1) and (heap[t div 2].dist > heap[t].dist) do begin
		 k:=heap[t div 2]; heap[t div 2]:=heap[t]; heap[t]:=k;
		 t:=t div 2;
	 end;
 end;

function getmin(var p:longint):longint;
 var
 	t,s:longint;
	k:node;
 begin
	 getmin:=heap[1].num;
	 k:=heap[1]; heap[1]:=heap[p]; heap[p]:=k;
	 dec(p);
	 t:=1;
	 while (t * 2 <= p) do begin
		 if (t*2 + 1 > p) or (heap[2 * t + 1].dist>heap[2 * t].dist) then s:=2 * t else s:=2 * t + 1;
		 if (heap[t].dist > heap[s].dist) then begin
			k:=heap[t]; heap[t]:=heap[s]; heap[s]:=k;
			t:=s;
		 end else break;
	 end;
 end;

begin
	assign(input,'prim.in'); reset(input);
	assign(output,'prim.out'); rewrite(output);
	readln(n,m);
	for i:=1 to n do
		for j:=1 to n do w[i,j]:=-1;
	for i:=1 to m do begin
		readln(x,y,k);
		w[x,y]:=k;
		w[y,x]:=k;
	end;
	total:=0; ans:=0;
	fillchar(s,sizeof(s),true);
	for i:=2 to n do f[i]:=maxint;
	f[1]:=0; insert(total,f[1],1);
	for i:=1 to n do begin
		repeat
			k:=getmin(total);
			until (s[k]=true) or (total=0);
		if s[k] then begin
			s[k]:=false;
			ans:=ans+f[k];
			for j:=1 to n do
				if (s[j]) and (w[k,j]>0) and (w[k,j]<f[j]) then begin
					f[j]:=w[k,j];
					insert(total,f[j],j);
				end;
		end;
		if total=0 then break;
	end;
	writeln(ans);
	close(input);
	close(output);
end.