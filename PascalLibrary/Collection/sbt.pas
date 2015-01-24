program sbt;
const
	maxn = 1000000;
var
	left,right,size,key,count:array[0..maxn] of longint;
	root,tot:longint;

procedure initialize;
 begin
	fillchar(left,sizeof(left),0);
	fillchar(right,sizeof(right),0);
	fillchar(size,sizeof(size),0);
	fillchar(key,sizeof(key),0);
	fillchar(count,sizeof(count),0);
	tot:=0; root:=0;
 end;

procedure right_rotate(var t:longint);
 var
	k:longint;
 begin
	k:=left[t]; left[t]:=right[k]; right[k]:=t;
	size[k]:=size[t]; size[t]:=size[left[t]] + size[right[t]] + count[t];
	t:=k;
 end;

procedure left_rotate(var t:longint);
 var
	k:longint;
 begin
	k:=right[t]; right[t]:=left[k]; left[k]:=t;
	size[k]:=size[t]; size[t]:=size[left[t]] + size[right[t]] + count[t];
	t:=k;
 end;

procedure maintain(var t:longint; flag:boolean);
 begin
	if (flag) then begin
		if (size[right[right[t]]] > size[left[t]]) then left_rotate(t)
			else if (size[left[right[t]]] > size[left[t]]) then begin
				right_rotate(right[t]);
				left_rotate(t);
			end else exit;
	end else begin
		if (size[left[left[t]]] > size[right[t]]) then right_rotate(t)
			else if (size[right[left[t]]] > size[right[t]]) then begin
				left_rotate(left[t]);
				right_rotate(t);
			end else exit;
	end;
	maintain(left[t],false);
	maintain(right[t],true);
	maintain(t,true);
	maintain(t,false);
 end;

procedure insert(var t:longint; x:longint);
 begin
	if (t = 0) then begin
		inc(tot); t:=tot;
		key[t]:=x; size[t]:=1; count[t]:=1;
		left[t]:=0; right[t]:=0;
		exit;
	end;
	inc(size[t]);
	if (x < key[t]) then insert(left[t],x)
		else if (x > key[t]) then insert(right[t],x)
			else inc(count[t]);
	maintain(t,x >= key[t]);
 end;

function delete(var t:longint; x:longint):longint;
 begin
	dec(size[t]);
	if (x = key[t]) and (count[t] > 1) then begin
		delete:=key[t];
		dec(count[t]);
		exit;
	end;
	if (x = key[t]) or ((x < key[t]) and (left[t] = 0)) or ((x > key[t]) and (right[t] = 0)) then begin
		delete:=key[t];
		if (left[t] = 0) or (right[t] = 0) then t:=left[t] + right[t]
			else key[t]:=delete(left[t],key[t] + 1);
	end else begin
		if (x < key[t]) then delete:=delete(left[t],x) else delete:=delete(right[t],x);
	end;
	
 end;

function find(var t:longint; x:longint):boolean;
 begin
	if (t = 0) then exit(false);
	if (x < key[t]) then find:=find(left[t],x)
		else find:=(key[t] = x) or (find(right[t],x));
 end;

function rank(var t:longint; x:longint):longint;
 begin
	if (t = 0) then exit(1);
	if (x <= key[t]) then rank:=rank(left[t],x)
		else rank:=size[left[t]] + count[t] + rank(right[t],x);
 end;

function select(var t:longint; x:longint):longint;
 begin
	if (x >= size[left[t]] + 1) and (x <= size[left[t]] + count[t]) then exit(key[t]);
	if (x <= size[left[t]]) then select:=select(left[t],x)
		else select:=select(right[t],x - count[t] - size[left[t]]);
 end;

function pred(var t:longint; x:longint):longint;
 begin
	if (t = 0) then exit(x);
	if (x <= key[t]) then exit(pred(left[t],x));
	pred:=pred(right[t],x);
	if (pred = x) then pred:=key[t];
 end;

function succ(var t:longint; x:longint):longint;
 begin
	if (t = 0) then exit(x);
	if (key[t] <= x) then exit(succ(right[t],x));
	succ:=succ(left[t],x);
	if (succ = x) then succ:=key[t];
 end;
 
function maximum(t:longint):longint;
 begin
 	while (right[t] <> 0) do t:=right[t];
 	exit(key[t]);
 end;
 
function minimum(t:longint):longint;
 begin
 	while (left[t] <> 0) do t:=left[t];
 	exit(key[t]);
 end;

begin
	initialize;
end.