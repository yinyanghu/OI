program loj_0012;
type arr=array[1..10000] of longint;
var a,c,temp:arr;
    i,j,m,n,x,y,z:longint;
    ch:char;

procedure flip(l,r:longint);
 var k:longint;
 begin
     if (l<r) then begin
         k:=a[l]; a[l]:=a[r]; a[r]:=k;
         flip(l+1,r-1);
     end;
 end;

procedure cut(x,y,z:longint);
 var i,k:longint;
 begin
     k:=1;
     for i:=x to y do begin
         temp[k]:=a[i];
         inc(k);
     end;
     for i:=1 to x-1 do c[i]:=a[i];
     k:=x;
     for i:=y+1 to n do begin
         c[k]:=a[i];
         inc(k);
     end;
     for i:=1 to z do a[i]:=c[i];
     k:=z+1;
     for i:=1 to (y-x+1) do begin
         a[k]:=temp[i];
         inc(k);
     end;
     for i:=z+1 to (n-(y-x+1)) do begin
         a[k]:=c[i];
         inc(k);
     end;
 end;

begin
    assign(input,'cf.in'); reset(input);
    readln(n,m);
    for i:=1 to n do a[i]:=i;
    for i:=1 to m do begin
        read(ch);
        if ch='C' then begin
            for j:=1 to 3 do read(ch);
            readln(x,y,z);
            cut(x,y,z);
        end else if ch='F' then begin
            for j:=1 to 4 do read(ch);
            readln(x,y);
            flip(x,y);
        end;
    end;
    for i:=1 to n-1 do write(a[i],' ');
    write(a[n]);
    close(input);
end.
