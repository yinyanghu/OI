var
        color   :       array[1..100] of longint;
        adj     :       array[1..100,1..100] of boolean;
        n       :       longint;

procedure prepare;
var
        i,k     :       longint;
begin
  readln(n);
  fillchar(adj,sizeof(adj),false);
  for i:=1 to n do
    repeat
      read(k);
      if k=0 then break;
      adj[i,k]:=true;
      adj[k,i]:=true;
    until false;
  fillchar(color,sizeof(color),255);
end;

procedure work;
var
        q                 :       array[1..10000] of longint;
        head,tail,i,j,x   :       longint;
begin
  for x:=1 to n do
    if color[x]=-1 then
      begin
        head:=1;tail:=1;
        color[x]:=0;
        q[1]:=x;
        repeat
          j:=head;
          for i:=1 to n do
            if adj[j,i] then
              if color[i]=-1 then
                begin
                  inc(tail);
                  color[i]:=(color[j]+1) and 1;
                  q[tail]:=i;
                end
              else
                if color[i]<>(color[j]+1) and 1 then
                  begin
                    writeln(-1);
                    halt;
                  end;
          inc(head);
        until head>tail;
      end;
end;

procedure print;
var
        i       :       longint;
begin
  for i:=1 to n do write(color[i]);
  writeln;
end;


begin
  prepare;
  work;
  print;
end.
