program p2132;
const maxn=25;
      maxl=2000;
var prime:array[1..maxl] of boolean;
    a,s:array[1..maxn,1..maxn] of longint;
    flag:array[1..maxn] of boolean;
    i,j,k,max,n:longint;
    ans:int64;
procedure getprime(x:longint);
 var k,i:longint;
 begin
     fillchar(prime,sizeof(prime),true);
     prime[1]:=false; prime[2]:=true;
     k:=2;
     while k<=sqrt(x) do begin
	 while (not prime[k]) and (k<x) do inc(k);
	 i:=2;
	 while i*k<=x do begin
	     prime[i*k]:=false;
	     inc(i);
	 end;
	 inc(k);
     end;
 end;

function rebuild(p:longint):boolean;
 var i,j,k:longint;
 begin
     rebuild:=false;
     for i:=1 to n do
	for j:=i to n do
	    if (a[i,j]<>0) and (a[i,j] mod p=0) then begin
	       k:=a[i,j]; s[i,j]:=0; rebuild:=true;
	       while (k mod p=0) do begin
		   inc(s[i,j]); k:=k div p;
	       end;
	       s[j,i]:=s[i,j];
	    end else begin s[i,j]:=0; s[j,i]:=0; end;
 end;

function check(x,w:longint):boolean;
 var i:longint;
 begin
     if x=2 then exit(true);
     for i:=1 to n do
	if (flag[i]) and (s[x,i]>w) then begin
	    flag[i]:=false;
	    if check(i,w) then exit(true);
	end;
     check:=false;
 end;

begin
    readln(n); max:=-1;
    for i:=1 to n do begin
	for j:=1 to n do begin
	    read(a[i,j]);
	    if a[i,j]>max then max:=a[i,j];
	end;
	readln;
    end;
    getprime(max);
    ans:=1;
    for i:=1 to max do
	if prime[i] then begin
	    if not rebuild(i) then continue;
	    k:=0;
            fillchar(flag,sizeof(flag),true);
	    flag[1]:=false;
	    while check(1,k) do begin
                inc(k);
                fillchar(flag,sizeof(flag),true);
	        flag[1]:=false;
            end;
	    for j:=1 to k do ans:=ans*i;
	end;
    writeln(ans);
end.
