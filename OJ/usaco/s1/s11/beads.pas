{
ID:lijianx1
PROG:beads
LANG:PASCAL
}
program beads;
const maxn=350;
var a:array[1..maxn*2] of char;
    i,n,k,max:longint;
function right(x:longint):longint;
 var i,total:longint;
     now:char;
 begin
      total:=0; now:='p';
      for i:=x to x+n-1 do
         if a[i]='w' then inc(total)
	      else if now='p' then begin
	         inc(total); now:=a[i];
              end else if now=a[i] then inc(total)
		      else exit(total);
 end;

function left(x:longint):longint;
 var i,k,total:longint;
     now:char;
 begin
     i:=x-1; now:='p'; k:=0; total:=0;
     while k<=n do begin
         if i=0 then i:=2*n; inc(k);
	 if a[i]='w' then inc(total)
             else if now='p' then begin
	        inc(total); now:=a[i];
	     end else if now=a[i] then inc(total)
	        else exit(total);
	 dec(i);
     end;
 end;

begin
    assign(input,'beads.in'); reset(input);
    readln(n);
    for i:=1 to n do begin
	read(a[i]);
	a[i+n]:=a[i];
    end;
    close(input);
    max:=0;
    for i:=1 to n do begin
        k:=left(i)+right(i);
	if k>=n then k:=n;
	if k>max then max:=k;
    end;
    assign(output,'beads.out'); rewrite(output);
    writeln(max);
    close(output);
end.
