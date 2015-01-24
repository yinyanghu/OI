{
ID:lijianx1
PROG:runround
LANG:PASCAL
}
program runround;
var n,k,w:dword;
function check(x:dword):boolean;
 var s:string;
     i,j,k,m,l:longint;
     a:array['1'..'9'] of longint;
     ok:array[1..9] of boolean;
 begin
     str(x,s);
     if pos('0',s)<>0 then exit(false);
     fillchar(a,sizeof(a),0);
     l:=length(s);
     for i:=1 to l do begin
	 inc(a[s[i]]);
	 if a[s[i]]>1 then exit(false);
     end;
     fillchar(ok,sizeof(ok),false);
     k:=0; m:=1;
     while not ok[m] do begin
	 inc(k);
	 ok[m]:=true;
	 val(s[m],i);
	 m:=(m+i-1) mod l+1;
     end;
     if (m=1) and (k=l) then exit(true) else exit(false);
 end;

begin
    assign(input,'runround.in'); reset(input);
    readln(n);
    close(input);
    w:=maxlongint*2+1;
    for k:=n+1 to w do
	if check(k) then break;
    assign(output,'runround.out'); rewrite(output);
    writeln(k);
    close(output);
end.
