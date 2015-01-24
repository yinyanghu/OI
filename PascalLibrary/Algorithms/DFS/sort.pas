program sort;
var k,n,total:integer;
    s:string;
    x:array[1..100] of integer;

procedure input;
 begin
     readln(n);
     if (n>5) then begin
         writeln('N is too large!');
         readln;
         halt;
     end;
     readln(s);
     total:=0;
 end;

function place(k:integer):boolean;
 var i:integer;
 begin
     place:=true;
     for i:=1 to k-1 do
       if (x[i]=x[k]) then begin
           place:=false;
           break;
       end;
 end;

procedure print;
 var i:integer;
 begin
     inc(total);
     for i:=1 to n do write(s[x[i]]);
     write('   ');
     if total mod 8=0 then writeln;
 end;

procedure try(k:integer);
 var i:integer;
 begin
     if (k=n+1) then begin
         print;
         exit;
     end;
     for i:=1 to n do begin
         x[k]:=i;
         if place(k) then try(k+1);
     end;
 end;

begin
    input;
    try(1);
    if (total=0) then writeln('No answer!') else writeln('Total=',total);
end.