program bag; {  f[i,j]=max(f[i-1,j-w[i]]+p[i],f[i-1,j])  }

const maxm=2000;
      maxn=100;

var m,n:integer;
    p,w:array[1..maxn] of integer;
    f:array[0..maxm] of integer;

procedure init;
 var i:integer;
 begin
     assign(input,'01bag.in'); reset(input);
     readln(m,n);
     for i:=1 to n do readln(w[i],p[i]);
     close(input);
     fillchar(f,sizeof(f),0);
 end;

function max(x,y:integer):integer;
 begin
     if x>y then max:=x else max:=y;
 end;

procedure main;
 var i,j:integer;
 begin
     for i:=1 to n do
       for j:=m downto 1 do
           if j>=w[i] then f[j]:=max(f[j-w[i]]+p[i],f[j]);
 end;

procedure print;
 begin
     assign(output,'01bag.out'); rewrite(output);
     writeln('Max Value=',f[m]);
     close(output);
 end;

begin
    init;
    main;
    print;
end.
