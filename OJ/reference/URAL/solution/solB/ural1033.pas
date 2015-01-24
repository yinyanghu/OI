const
        dir           :       array[1..4,1..2] of longint
                      =       ((1,0),(-1,0),(0,1),(0,-1));

var
        map,check     :       array[0..34,0..34] of boolean;
        ans           :       longint;
        i,j,k,n       :       longint;
        ch            :       char;

procedure prepare;
begin
//  assign(input,'lab\laby4.in');reset(input);
  readln(n);
  fillchar(map,sizeof(map),false);
  for i:=1 to n do
    begin
      for j:=1 to n do
        begin
          read(ch);
          if ch='.' then map[i,j]:=true;
        end;
      readln;
    end;
end;

procedure solve(ix,iy:longint);
var
        q                      :       array[1..10000,1..2] of longint;
        head,tail,x,y          :       longint;
begin
  q[1,1]:=ix;
  q[1,2]:=iy;
  head:=1;
  tail:=1;
  check[ix,iy]:=true;
  repeat
    for i:=1 to 4 do
      begin
        x:=q[head,1]+dir[i,1];
        y:=q[head,2]+dir[i,2];
        if check[x,y] then continue;
        if map[x,y] then
          begin
            inc(tail);
            q[tail,1]:=x;
            q[tail,2]:=y;
            check[x,y]:=true;
          end
        else inc(ans);
      end;
    inc(head);
  until head>tail;
end;


begin
  prepare;
  solve(1,1);
  if not check[n,n] then
    solve(n,n);
  writeln((ans-4)*9);
end.
