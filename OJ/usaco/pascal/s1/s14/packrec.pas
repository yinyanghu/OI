{
ID:lijianx1
PROG:packrec
LANG:PASCAL
}
program packrec;
var v:array[1..4,1..2] of longint;
    ans:array[1..2500] of longint;
    i,min:longint;
function max(a,b,c,d:longint):longint;
 begin
     if a>b then max:=a else max:=b;
     if max<c then max:=c;
     if max<d then max:=d;
 end;
procedure compare(y,x:longint);
 var i:longint;
 begin
     if x>y then begin
	 i:=x; x:=y; y:=i;
     end;
     if x*y<=min then begin
	 min:=x*y;
	 ans[x]:=y;
     end;
 end;

procedure make;
 var a,b,c,d,w,x,y,z,ww,xx,yy,zz,aa,bb,cc,dd:longint;
 begin
     for aa:=1 to 4 do
	for bb:=1 to 4 do
	    if aa<>bb then
		for cc:=1 to 4 do 
		    if (aa<>cc) and (bb<>cc) then
			 for a:=1 to 2 do
			 for b:=1 to 2 do
			 for c:=1 to 2 do
			 for d:=1 to 2 do begin
			     dd:=10-aa-bb-cc;
			     w:=v[aa,a]; ww:=v[aa,3-a]; x:=v[bb,b]; xx:=v[bb,3-b];
			     y:=v[cc,c]; yy:=v[cc,3-c]; z:=v[dd,d]; zz:=v[dd,3-d];
			     compare(max(w,x,y,z),ww+xx+yy+zz);
			     compare(max(w,x,y,0)+z,max(ww+xx+yy,zz,0,0));
			     compare(max(max(w,x,0,0)+z,y,0,0),max(ww+xx,zz,0,0)+yy);
			     compare(max(w,x+y,z,0),max(xx,yy,0,0)+ww+zz);
			     if ((y<z) and (xx>yy)) or ((z<y) and (ww>zz)) then begin
				compare(max(w+z,x+y,0,0),max(ww,zz,0,0)+max(xx,yy,0,0));
				compare(max(w,x,0,0)+max(z,y,0,0),max(ww+xx,zz+yy,0,0));
			     end else compare(max(w+z,x+y,0,0),max(ww+xx,yy+zz,0,0));
			 end;
 end;

begin
    assign(input,'packrec.in'); reset(input);
    for i:=1 to 4 do readln(v[i,1],v[i,2]);
    close(input);
    min:=maxlongint;
    make;
    assign(output,'packrec.out'); rewrite(output);
    writeln(min);
    for i:=1 to trunc(sqrt(min)) do
	if (ans[i]<>0) and (ans[i]*i=min) then writeln(i,' ',ans[i]);
    close(output);
end.