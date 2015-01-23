program max;
var n,m,len,i,j,k,t:longint;
    a:array[1..2000] of longint;

procedure multiply(p:longint);
 var i,j,k,s:longint;
 begin
     k:=0;
     for i:=1 to len+3 do begin
         s:=a[i]*p+k;
         k:=s div 10;
         a[i]:=s mod 10;
     end;
     len:=len+10;
     while a[len]=0 do dec(len);
 end;

begin
    assign(input,'max.in'); reset(input);
    assign(output,'max.out'); rewrite(output);
    readln(n);
    t:=n mod 3;
    fillchar(a,sizeof(a),0);
    a[1]:=1; len:=1;
    m:=n div 3;
    if (t=0) or (t=2) then for i:=1 to m do multiply(3)
        else for i:=1 to m-1 do multiply(3);
    if t=1 then multiply(4)
      else if t=2 then multiply(2);
    for i:=len downto 1 do write(a[i]);
    writeln;
    write(len);
    close(input);
    close(output);
end.
