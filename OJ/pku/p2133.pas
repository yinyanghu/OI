program p2133;
const maxl=16;
      maxm=1 shl (maxl+1)-1;
      maxn=100;
var f:array[0..maxm] of longint;
    a:array[1..maxn] of longint;
    flag:array[0..maxm] of boolean;
    w,n,bit:longint;
procedure init;
 var i,j:longint;
     ch:char;
 begin
     readln(bit,n);
     w:=0;
     for i:=1 to bit do begin
	 read(ch);
	 w:=w shl 1;
	 if ch='1' then w:=w+1;
     end;
     readln;
     for i:=1 to n do begin
	 a[i]:=0;
	 for j:=1 to bit do begin
	     read(ch);
	     a[i]:=a[i] shl 1;
	     if ch='1' then a[i]:=a[i]+1;
	 end;
	 readln;
     end;
 end;

procedure print(x:longint);
 var k,i:longint;
     b:array[1..maxl] of boolean;
 begin
     k:=0;
     fillchar(b,sizeof(b),false);
     while x<>0 do begin
	 inc(k);
	 b[k]:=x and 1=1;
	 x:=x shr 1;
     end;
     for i:=bit downto 1 do
	if b[i] then write(1) else write(0);
     writeln;
 end;

function count(x:longint):longint;
 var k:longint;
 begin
     k:=0;
     while x>0 do begin
	 k:=k+x and 1;
	 x:=x shr 1;
     end;
     count:=k;
 end;

procedure main;
 var i,j,k,ans,step,min:longint;
 begin
     for i:=0 to (1 shl (bit+1)-1) do f[i]:=maxlongint;
     fillchar(flag,sizeof(flag),false);
     for i:=1 to n do begin
	 f[a[i]]:=2;
	 flag[a[i]]:=true;
     end;
     for i:=1 to n do
	for j:=0 to (1 shl (bit+1)-1) do
	    if (f[j]<maxlongint) or (flag[j]) then begin
		if flag[j] then k:=0 else k:=f[j];
		if f[j xor a[i]]>k+1 then f[j xor a[i]]:=k+1;
	    end;
     min:=maxlongint; step:=maxlongint; ans:=0;
     for i:=0 to (1 shl (bit+1)-1) do
	if f[i]<maxlongint then begin
	    k:=count(i xor w);
	    if (k<min) or ((k=min) and (f[i]<step)) then begin
		ans:=i; min:=k; step:=f[i];
	    end;
	end;
     writeln(step);
     print(ans);
 end;

begin
    init;
    main;
end.