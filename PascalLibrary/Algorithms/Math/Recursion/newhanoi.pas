program newhanoi;

const maxn=64;
      stake:array[1..3] of char=('A','B','C');

type tnode=array[1..maxn] of byte;

var n:integer;
    now,goal:tnode;
    step:longint;

procedure init;
 var i,j,l,x:integer;
 begin
     readln(n);
     for i:=1 to 3 do begin
         read(l);
         for j:=1 to l do begin
             read(x);
             now[x]:=i;
         end;
         readln;
     end;
     for i:=1 to 3 do begin
         read(l);
         for j:=1 to l do begin
             read(x);
             goal[x]:=i;
         end;
         readln;
     end;
 end;

procedure main;
 var i:integer;
 procedure move(k:integer;w:byte);
  var i,j:word;
  begin
      if (now[k]=w) then exit;
      j:=6-now[k]-w;
      for i:=k-1 downto 1 do move(i,j);
      write('Move ',k,' From ',stake[now[k]],' to ',stake[w]);
      writeln('.');
      now[k]:=w;
      inc(step);
  end;
 begin
    for i:=n downto 1 do move(i,goal[i]);
    writeln('total step=',step);
    readln;
 end;

begin
    init;
    main;
end.