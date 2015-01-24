program tnterval;
const
	limitsize = 1000;
	root = 1;
var
	left,right,key,count:array[1..limitsize] of longint;
procedure initialize;
 begin
 	fillchar(key,sizeof(key),0);
 	fillchar(count,sizeof(count),0);
 end;
 
procedure buildtree(k,l,r:longint);
 var
 	mid:longint;
 begin
 	left[k]:=l; right[k]:=r;
 	if (l + 1 = r) then exit;
 	mid:=(l + r) shr 1;
 	buildtree(k * 2,l,mid);
 	buildtree(k * 2 + 1,mid,r); 	
 end;

procedure passmark(k:longint);
 begin
 	key[k * 2]:=right[k * 2] - left[k * 2];
 	key[k * 2 + 1]:=right[k * 2 + 1] - left[k * 2 + 1];
 end;

procedure insert(k,x,y:longint);
 var
 	mid:longint;
 begin
 	if (count[k] > 0) then passmark(k);
 	if (x = left[k]) and (y = right[k]) then begin
 		inc(count[k]);
 		if (count[k] > 0) then key[k]:=right[k] - left[k];
 		exit;
 	end;
 	mid:=(left[k] + right[k]) shr 1;
 	if (y <= mid) then insert(k * 2,x,y)
 		else if (x >= mid) then insert(k * 2 + 1,x,y)
 			else begin
 				insert(k * 2,x,mid);
 				insert(k * 2 + 1,mid,y);
 			end;
 	if (count[k] > 0) then key[k]:=right[k] - left[k]
 		else key[k]:=key[k * 2] + key[k * 2 + 1];
 end;

procedure delete(k,x,y:longint);
 var
 	mid:longint;
 begin
  	if (count[k] > 0) then passmark(k);
 	if (x = left[k]) and (y = right[k]) then begin
 		dec(count[k]);
 		if (count[k] > 0) then key[k]:=right[k] - left[k] else key[k]:=key[k * 2] + key[k * 2 + 1];
 		exit;
 	end;
 	mid:=(left[k] + right[k]) shr 1;
 	if (y <= mid) then delete(k * 2,x,y)
 		else if (x >= mid) then delete(k * 2 + 1,x,y)
 			else begin
 				delete(k * 2,x,mid);
 				delete(k * 2 + 1,mid,y);
 			end;
 	if (count[k] > 0) then key[k]:=right[k] - left[k]
 		else key[k]:=key[k * 2] + key[k * 2 + 1];
 end;

function getlength:longint;
 begin
 	exit(key[root]);
 end;

begin
	initialize;
	buildtree(root,1,6);
	insert(root,1,3); writeln(getlength); insert(root,3,5); writeln(getlength);
	insert(root,2,4); writeln(getlength);
	delete(root,1,3); writeln(getlength);
end.