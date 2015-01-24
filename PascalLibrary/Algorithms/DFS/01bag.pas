program bag;
var max,n,m:integer;
    f,s,c:array[1..10000] of integer;

procedure init;
 var i:integer;
 begin
     assign(input,'01bag.in'); reset(input);
     readln(m,n);
     for i:=1 to n do readln(s[i],c[i]);
     close(input);
     fillchar(f,sizeof(f),0);
     max:=-1;
 end;

procedure check;
 var i,w,p:integer;
 begin
     w:=0; p:=0;
     for i:=1 to n do
       if (f[i]=1)  then begin
           w:=w+s[i];
           p:=p+c[i];
       end;
     if (w<=m) and (p>max) then max:=p;
 end;

procedure search(k:integer);
 begin
     if k>n then check
       else begin
           f[k]:=0; search(k+1);
           f[k]:=1; search(k+1);
       end;
 end;

procedure print;
 begin
     assign(output,'01bag.out'); rewrite(output);
     writeln('Max Value=',max);
     close(output);
 end;

begin
    init;
    search(1);
    print;
end.
