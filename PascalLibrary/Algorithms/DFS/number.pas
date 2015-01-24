program number;
var n,s:integer;
    total:longint;

procedure init;
 begin
     assign(input,'number.in'); reset(input);
     readln(n,s);
     close(input);
     total:=0;
 end;

procedure search(k,l,last:integer);
 var i:integer;
 begin
     if k=2 then total:=total+l div 2-last+1
       else for i:=last to l div k do search(k-1,l-i,i);
 end;

procedure print;
 begin
     assign(output,'number.out'); rewrite(output);
     writeln(total);
     close(output);
 end;

begin
    init;
    search(s,n,1);
    print;
end.