program p1503;
const maxn=103;
type arr=array[1..maxn] of longint;
var a,ans:arr;
    s:string;
    l,i,k:longint;
procedure plus(a,b:arr; var c:arr);
 var i,k:longint;
 begin
     k:=0;
     for i:=1 to maxn do begin
	 c[i]:=a[i]+b[i]+k;
	 k:=c[i] div 10;
	 c[i]:=c[i] mod 10;
     end;
 end;

begin
    readln(s);
    fillchar(ans,sizeof(ans),0);
    while s<>'0' do begin
	l:=length(s);
	for i:=1 to l do a[i]:=ord(s[l-i+1])-48;
	plus(ans,a,ans);
        readln(s);
    end;
    k:=maxn;
    while (ans[k]=0) and (k>1) do dec(k);
    for i:=k downto 1 do write(ans[i]);
    writeln;
end.