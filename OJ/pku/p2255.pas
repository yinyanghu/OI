program p2255;
var x,z:string;
    k:longint;
procedure find(a,b:string);
 var s,l:longint;
 begin
     l:=length(a);
     if l=1 then write(a) else begin
	 s:=pos(a[1],b);
	 if (s-1>0) then find(copy(a,2,s-1),copy(b,1,s-1));
	 if (l-s>0) then find(copy(a,s+1,l-s),copy(b,s+1,l-s));
	 write(a[1]);
     end;
 end;

begin
    while not eof do begin
	readln(z);
	k:=pos(' ',z);
	x:=copy(z,1,k-1);
	delete(z,1,k);
	find(x,z);
	writeln;
    end;
end.