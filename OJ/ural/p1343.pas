program p1343;
const maxlen=12;
      s=4;
      a:array[1..s] of int64=(2,3,5,7);
   
function getmulmod(a,b,c:int64):int64;
 var k:int64;
 begin
     if b=0 then exit(0);
     k:=getmulmod(a,b shr 1,c);
     k:=k shl 1 mod c;
     if odd(b) then k:=(k+a) mod c;
     getmulmod:=k;
 end;
	       
function getexpmod(a,b,c:int64):int64;
 var k:int64;
 begin
     if b=0 then exit(1);
     k:=getexpmod(a,b shr 1,c);
     k:=getmulmod(k,k,c);
     if odd(b) then k:=getmulmod(k,a,c);
     getexpmod:=k;
 end;    

function witness(a,n:int64):boolean;
 var i,t:longint;
     k,x,y:int64;
 begin
     k:=n-1; t:=0;
     while (k and 1=0) do begin
	 inc(t); k:=k shr 1;
     end;
     x:=getexpmod(a,k,n);
     for i:=1 to t do begin
	 y:=getmulmod(x,x,n);
	 if (y=1) and (x<>1) and (x<>n-1) then exit(true);
	 x:=y;
     end;
     if y<>1 then exit(true) else exit(false);
 end;

function check(n:int64):boolean;
 var i:longint;
 begin
     if (n and 1=0) then exit(false);
     for i:=1 to s do
	 if witness(a[i],n) then exit(false);
     check:=true;
 end;

procedure main;
 var i,l:longint;
     t:string;
     ch:char;
     n,k,p:int64;
 begin
     readln(l);
     n:=0;
     for i:=1 to l do begin
	 repeat
            read(ch);
	 until ch in ['0'..'9'];
	 n:=n*10+ord(ch)-48;
     end;
     k:=1;
     for i:=l+1 to maxlen do k:=k*10;
     n:=n*k;
     randomize;
     while true do begin
	 p:=n+trunc(random*k);
	 if (p=0) or (p=1) then continue;
	 if check(p) then begin
	     str(p:12,t);
	     for i:=1 to maxlen do
		if t[i]=' ' then write('0') else write(t[i]);
	     writeln;
	     halt;
	 end;
     end;
 end;

begin
    main;
end.

