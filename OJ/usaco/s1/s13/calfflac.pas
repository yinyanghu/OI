{
ID:lijianx1
PROG:calfflac
LANG:PASCAL
}
program calfflac;
const maxn=20000;
var a:array[1..maxn] of char;
    st:array[0..maxn] of string;
    n,i,max,start:longint;
    c:char;

function check(c:char):boolean;
 begin
     if (c>='A') and (c<='Z') or (c>='a') and (c<='z') then check:=true else check:=false;
 end;

function change(c:char):char;
 begin
     if (c>='A') and (c<='Z') then change:=chr(ord(c)+32) else change:=c;
 end;

procedure extend(s,t:longint);
 var l:longint;
 begin
     while (s>1) and (t<n) do
	if a[s-1]=a[t+1] then begin
	   dec(s); inc(t);
	end else break;
     l:=t-s+1;
     if (l>max) or (l=max) and (s<start) then begin
	 max:=l; start:=s;
     end;
 end;

begin
    assign(input,'calfflac.in'); reset(input);
    n:=0;
    fillchar(st,sizeof(st),0);
    while not eof do begin
	read(c);
	if check(c) then begin
	    inc(n);
	    a[n]:=change(c);
	end;
	st[n]:=st[n]+c;
    end;
    close(input);
    max:=0;
    for i:=1 to n do extend(i,i);
    for i:=2 to n do if a[i]=a[i-1] then extend(i-1,i);
    assign(output,'calfflac.out'); rewrite(output);
    writeln(max);
    for i:=start to start+max-2 do write(st[i]);
    writeln(st[start+max-1,1]);
    close(output);
end.