{
ID:lijianx1
PROG:comehome
LANG:PASCAL
}
program comehome;
const maxn=52;
var a:array[1..maxn,1..maxn] of longint;
procedure init;
 var i,n,k,l,r,j:longint;
     ch,x,y:char;
 begin
     for i:=1 to maxn do
	for j:=1 to maxn do
	    if i=j then a[i,j]:=0 else a[i,j]:=maxint;
     assign(input,'comehome.in'); reset(input);
     readln(n);
     for i:=1 to n do begin
	 read(x,ch,y); readln(k);
	 if x in ['a'..'z'] then l:=ord(x)-70 else l:=ord(x)-64;
	 if y in ['a'..'z'] then r:=ord(y)-70 else r:=ord(y)-64;
	 if a[l,r]>k then begin
	     a[l,r]:=k; a[r,l]:=k;
	 end;
     end;
     close(input);
 end;



procedure main;
 var i,j,k:longint;
 begin
     for k:=1 to maxn do
	for i:=1 to maxn do
	    for j:=1 to maxn do
		if a[i,k]+a[k,j]<a[i,j] then a[i,j]:=a[i,k]+a[k,j];
 end;  

procedure print;
 var x,i,min:longint;
 begin
     min:=maxlongint;
     for i:=1 to 25 do
	if a[26,i]<min then begin
	    min:=a[26,i]; x:=i;
	end;
     assign(output,'comehome.out'); rewrite(output);
     writeln(chr(x+64),' ',min);
     close(output);
 end;

begin
    init;
    main;
    print;
end.