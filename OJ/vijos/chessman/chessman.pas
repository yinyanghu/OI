program chessman;
const max=100;
var n,l:integer;
    total:longint;
    c:array[1..max] of char;

procedure print;
 var i:integer;
 begin
     write('step ',total,':');
     for i:=1 to 2*n+2 do write(c[i]);
     writeln;
     inc(total);
 end;

procedure init(n:integer);
 var i:integer;
 begin
     total:=0;
     l:=2*n+1;
     for i:=1 to n do c[i]:='o';
     for i:=n+1 to 2*n do c[i]:='*';
     c[2*n+1]:='-';
     c[2*n+2]:='-';
     print;
 end;
procedure move(k:integer);
 var i:integer;
 begin
     for i:=0 to 1 do begin
         c[l+i]:=c[k+i];
         c[k+i]:='-';
     end;
     l:=k;
     print;
 end;
procedure mv(n:integer);
 var i,k:integer;
 begin
     if (n=4) then begin
         move(4);
         move(8);
         move(2);
         move(7);
         move(1);
     end else begin
         move(n);
         move(2*n-1);
         mv(n-1);
     end;
 end;
begin
    assign(input,'chessman.in'); reset(input);
    assign(output,'chessman.out'); rewrite(output);
    readln(n);
    init(n);
    mv(n);
    close(input);
    close(output);
end.
