{
ID:lijianx1
PROG:transform
LANG:PASCAL
}
program transform;
const maxn=10;
var a,tmp,s:array[1..maxn,1..maxn] of boolean;
    i,j,n:longint;
    c:char;

procedure change(k:longint);
 var i,j:longint;
 begin
     for i:=1 to n do
        for j:=1 to n do
           case k of
               1:tmp[j,n+1-i]:=a[i,j];
               2:tmp[n+1-i,n+1-j]:=a[i,j];
               3:tmp[n+1-j,i]:=a[i,j];
               4:tmp[i,n+1-j]:=a[i,j];
               5:tmp[n+1-j,n+1-i]:=a[i,j];
               6:tmp[n+1-i,j]:=a[i,j];
               7:tmp[j,i]:=a[i,j];
               8:tmp[i,j]:=a[i,j];
           end;
 end;

procedure check(k:longint);
 var i,j:longint;
 begin
     for i:=1 to n do
       for j:=1 to n do
         if tmp[i,j]<>s[i,j] then exit;
     writeln(k);
     close(output);
     halt;
 end;

begin
    assign(input,'transform.in'); reset(input);
    readln(n);
    for i:=1 to n do begin
        for j:=1 to n do begin
	    read(c);
	    a[i,j]:=c='@';
        end;
        readln;
    end;
    for i:=1 to n do begin
        for j:=1 to n do begin
            read(c);
            s[i,j]:=c='@';
        end;
        readln;
    end;
    close(input);
    assign(output,'transform.out'); rewrite(output);
    change(1); check(1);
    change(2); check(2);
    change(3); check(3);
    change(4); check(4);
    change(5); check(5);
    change(6); check(5);
    change(7); check(5);
    change(8); check(6);
    writeln(7);
    close(output);
end.
