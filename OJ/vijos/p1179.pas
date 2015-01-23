program p1179;
var i,m,n,max,t:longint;
    f:array[0..10000] of longint;
    a,b:array[0..11] of longint;

procedure check(dep:longint);
 var i,j:longint;
 begin
     fillchar(f,sizeof(f),$7f);
     for i:=1 to dep do f[a[i]]:=1;
     for i:=2 to 5000 do begin
         for j:=1 to dep do
            if (i>a[j]) and (f[i]>f[i-a[j]]+1) then f[i]:=f[i-a[j]]+1;
         if f[i]>m then break;
     end;
     t:=i;
     if i-1>max then begin
         max:=i-1;
         b:=a;
     end;
 end;

procedure try(i:longint);
 var k:longint;
 begin
    for k:=t downto a[i-1]+1 do 
      if k<=100 then begin
          a[i]:=k;
          if i<n then begin
             check(i);
             try(i+1);
          end else check(n);
      end;
 end;

begin
    readln(m,n);
    a[1]:=1;
    t:=m+1;
    try(2);
    for i:=1 to n do write(b[i],' ');
    writeln;
    writeln('MAX=',max);
end.
