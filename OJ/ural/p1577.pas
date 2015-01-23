program p1577;
const sub=1000000007;
      maxn=2000;
var l1,l2,i,j:longint;
    n,m:string;
    f,ans:array[0..maxn,0..maxn] of longint;
procedure updata(var x:longint; y:longint; var a:longint; b:longint);
 begin
     if x>y then begin
	x:=y; a:=b;
     end else if x=y then a:=a+b;
     a:=a mod sub;
 end;

begin
    readln(n); readln(m);
    l1:=length(n); l2:=length(m);
    fillchar(f,sizeof(f),$7F);
    for i:=1 to l1 do begin
	ans[i,0]:=1; f[i,0]:=i;
    end;
    for i:=0 to l2 do begin
	f[0,i]:=i; ans[0,i]:=1;
    end;
    for i:=1 to l1 do
	for j:=1 to l2 do begin
	    if n[i]=m[j] then updata(f[i,j],f[i-1,j-1]+1,ans[i,j],ans[i-1,j-1])
		else begin
		    updata(f[i,j],f[i-1,j]+1,ans[i,j],ans[i-1,j]);
		    updata(f[i,j],f[i,j-1]+1,ans[i,j],ans[i,j-1]);
		end;
	end;
    writeln(ans[l1,l2]);
end.
