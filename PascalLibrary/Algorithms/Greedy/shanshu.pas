program shanshu;
var a:string;
    max:char;
    i,j,s,n,p,m:integer;
begin
    readln(a,s);
    for j:=1 to s do begin
        max:='0';
        n:=length(a);
        for i:=1 to n do
          if a[i]>max then begin
              max:=a[i];
              p:=i;
          end;
        delete(a,p,1);
    end;
    n:=length(a);
    m:=1;
    while (m<n) do if a[m]='0' then begin
        delete(a,m,1);
        m:=1;
        n:=length(a);
    end else break;
    writeln(a);
    readln;
end.