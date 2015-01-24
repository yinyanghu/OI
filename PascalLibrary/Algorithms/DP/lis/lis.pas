program lis;
const maxn=100000;
var a:array[1..maxn] of longint;
    f:array[0..maxn] of longint;
    n,i,len:longint;
function find(x:longint):longint;
 var left,right,mid:longint;
 begin
     left:=0; right:=len;
     while left<=right do begin
         mid:=(left+right) shr 1;
	 if (x>f[mid]) and (x<=f[mid+1]) then exit(mid);
	 if x>f[mid] then left:=mid+1 else right:=mid-1;
     end;
 end;
begin
    assign(input,'lis.in'); reset(input);
    readln(n);
    for i:=1 to n do read(a[i]);
    close(input);
    len:=0;
    f[0]:=-maxlongint;
    for i:=1 to n do
	if a[i]>f[len] then begin
	    inc(len);
	    f[len]:=a[i];
	end else f[find(a[i])+1]:=a[i];
    assign(output,'lis.out'); rewrite(output);
    writeln(len);
    close(output);
end.
