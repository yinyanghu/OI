program color;
var n,total:longint;
    a:array[1..100,1..100] of 0..1;
    s:array[1..100] of integer;

procedure init;
 var i,j:integer;
 begin
     assign(input,'color.in'); reset(input);
     readln(n);
     for i:=1 to n do
       for j:=1 to n do read(a[i,j]);
     close(input);
     total:=0;
     fillchar(s,sizeof(s),0);
 end;

function ok(k,color:integer):boolean;
 var i:integer;
 begin
     for i:=1 to k do
       if (a[k,i]=1) and (color=s[i]) then begin
           ok:=false;
           exit;
       end;
     ok:=true;
 end;

procedure print;
 var i:integer;
 begin
     for i:=1 to n do writeln(i,'--->',s[i]);
     inc(total);
     writeln;
 end;

procedure find(k:integer);
 var i:integer;
 begin
     for i:=1 to 4 do
       if ok(k,i) then begin
           s[k]:=i;
           if k<n then find(k+1)
              else print;
           s[k]:=0;
       end;
 end;

begin
    init;
    writeln('The result:');
    find(1);
    writeln('Total=',total);
end.