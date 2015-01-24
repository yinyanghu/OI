program stamp;
const maxn=250;
type arr=array[0..maxn] of longint;
var i,kind,n,p:longint;
    s,r:array[1..10] of longint;
    d:arr;
procedure init;
 var i:integer;
 begin
     assign(input,'stamp.in'); reset(input);
     readln(n,kind);
     s[1]:=1;
     for i:=1 to maxn do d[i]:=maxint;
     for i:=1 to n do d[i]:=i;
     d[0]:=0; p:=0;
     close(input);
 end;

function find(var d:arr):longint;
 var c:longint;
 begin
     c:=1;
     while d[c]<=n do inc(c);
     find:=c;
 end;

procedure try(dep,c:longint; d:arr);
 var i,j,k:longint;
     temp:arr;
 begin
     if dep>kind then if c>p then begin
         p:=c;
         r:=s;
     end else else
     for i:=s[dep-1]+1 to c do begin
         s[dep]:=i;
         temp:=d;
         for j:=1 to n-1 do
          for k:=0 to maxn-i*j do
            if temp[k+j*i]>d[k]+j then temp[k+i*j]:=d[k]+j;
         if n*i<=maxn then temp[n*i]:=n;
         try(dep+1,find(temp),temp);
     end;
 end;

procedure print;
 var i:integer;
 begin
     assign(output,'stamp.out'); rewrite(output);
     for i:=1 to kind do write(r[i],' ');
     writeln;
     writeln('MAX=',p-1);
     close(output);
 end;

begin
    init;
    try(2,find(d),d);
    print;
end.