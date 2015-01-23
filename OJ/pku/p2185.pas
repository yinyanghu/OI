program p2185;
const maxw=10000;
      maxl=75;
var a:array[1..maxw,1..maxl] of char;
    s:array[1..maxw] of char;
    n,m,ans:longint;
procedure init;
 var i,j:longint;
 begin
     readln(n,m);
     for i:=1 to n do begin
         for j:=1 to m do read(a[i,j]);
         readln;
     end;
 end;
 
function kmp(len:longint):longint;
 var k,i:longint;
     w:array[1..maxw] of longint;
 begin
     k:=0; w[1]:=0;
     for i:=2 to len do begin
         while (k>0) and (s[k+1]<>s[i]) do k:=w[k];
         if s[k+1]=s[i] then inc(k);
         w[i]:=k;
     end;
     kmp:=len-w[len];
 end;
 
function gcd(a,b:longint):longint;
 begin
     if b=0 then gcd:=a else gcd:=gcd(b,a mod b);
 end;
 
procedure main;
 var w,l,i,j,k,p:longint;
 begin
     l:=1;
     for i:=1 to n do begin
         for j:=1 to m do s[j]:=a[i,j];
         k:=kmp(m);
         p:=gcd(l,k); l:=(l*k) div p;
         if l>=m then begin
             l:=m; break;
         end;
     end;
     w:=1;
     for i:=1 to m do begin
         for j:=1 to n do s[j]:=a[j,i];
         k:=kmp(n);
         p:=gcd(w,k); w:=(w*k) div p;
         if w>=n then begin
             w:=n; break;
         end;
     end;
     ans:=w*l;
 end;
 
procedure print;
 begin
     writeln(ans);
 end;
 
begin
    init;
    main;
    print;
end.