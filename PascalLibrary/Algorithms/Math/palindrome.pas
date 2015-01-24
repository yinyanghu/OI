program huiwen;
var a:string;
    i,j,s,k:integer;
    b:boolean;
begin
    writeln('A=');
    readln(a);
    s:=length(a);
    i:=1;
    k:=s div 2;
    while (i<=k) do if a[i]=a[s-i+1] then inc(i)  {important!}
      else begin
          writeln('No!');
          halt;
      end;
    writeln('Yes!');
    readln;
end.
