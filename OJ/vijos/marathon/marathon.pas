program marathon;
const max=25;
      man=5;
var a:array[1..man,1..10] of longint;
    s:array[1..man] of longint;
    min:longint;
procedure init;
 var i,j:integer;
 begin
     assign(input,'marathon.in'); reset(input);
     for i:=1 to man do
       for j:=1 to 10 do read(a[i,j]);
     close(input);
 end;

procedure work;
 var i,k,m,p:longint;
 begin
     min:=0;
     for i:=1 to man do begin
         min:=min+a[i,1];
         s[i]:=1;
     end;
     p:=max-man;
     while p>0 do begin
         m:=1;
         while s[m]=10 do inc(m);
         k:=m;
         for i:=m+1 to man do
           if s[i]<10 then
             if (a[i,s[i]+1]-a[i,s[i]]<a[k,s[k]+1]-a[k,s[k]])
               then k:=i;
         dec(p);
         min:=min+a[k,s[k]+1]-a[k,s[k]];
         inc(s[k]);
     end;
 end;

procedure print;
 var i:integer;
 begin
     assign(output,'marathon.out'); rewrite(output);
     writeln(min);
     for i:=1 to man-1 do write(s[i],' ');
     write(s[man]);
     close(output);
 end;

begin
    init;
    work;
    print;
end.