const
  maxn=250;
  maxa=200;
  bit=1000000;
type
  node=record
         a:array[0..maxa]of longint;
         l:integer;
       end;
var
  ans:node;
  t,n,k,i,j:integer;
  board:array[1..250]of integer;
  a:array[0..1,0..maxn]of node;

function xx(x:node;k:integer):node;
  var
    i:integer;
    ans:node;
  begin
    k:=k+1;
    if k<0 then k:=0;
    fillchar(ans,sizeof(ans),0);
    for i:=1 to x.l do
      ans.a[i]:=x.a[i]*k;
    if k<>0 then ans.l:=x.l
            else ans.l:=0;
    for i:=1 to ans.l-1 do
      if ans.a[i]>=bit then
        begin
          ans.a[i+1]:=ans.a[i] div bit+ans.a[i+1];
          ans.a[i]:=ans.a[i] mod bit;
        end;
    while ans.a[ans.l]>=bit do
      begin
        ans.a[ans.l+1]:=ans.a[ans.l] div bit;
        ans.a[ans.l]:=ans.a[ans.l] mod bit;
        inc(ans.l);
      end;
    xx:=ans;
  end;

function add(x,y:node):node;
  var
    i:integer;
    ans:node;
  begin
    fillchar(ans,sizeof(ans),0);
    for i:=1 to x.l do
      ans.a[i]:=x.a[i]+y.a[i];
    for i:=x.l+1 to y.l do
      ans.a[i]:=x.a[i]+y.a[i];
    ans.l:=x.l;
    if y.l>ans.l then ans.l:=y.l;
    for i:=1 to ans.l-1 do
      if ans.a[i]>=bit then begin
                             ans.a[i+1]:=ans.a[i] div bit+ans.a[i+1];
                             ans.a[i]:=ans.a[i] mod bit;
                           end;
    while ans.a[ans.l]>=bit do
      begin
        ans.a[ans.l+1]:=ans.a[ans.l] div bit+ans.a[ans.l+1];
        ans.a[ans.l]:=ans.a[ans.l] mod bit;
        inc(ans.l);
      end;
    add:=ans;
  end;


begin
  readln(n,k);
  for i:=1 to n do
    read(board[i]);
  a[0,0].a[1]:=1;
  a[0,0].l:=1;
  for i:=1 to n do
    for j:=i to n do
      if board[j]<board[i] then begin
                                  t:=board[i];
                                  board[i]:=board[j];
                                  board[j]:=t;
                                end;

  for i:=1 to n do
    begin
      a[i mod 2,0].a[1]:=1;
      a[i mod 2,0].l:=1;
      for j:=1 to i do
        a[i mod 2,j]:=add(xx( a[(i-1) mod 2,j-1] , board[i]-j ),a[(i-1) mod 2,j]);
    end;

  ans:=a[n mod 2,k];
  write(ans.a[ans.l]);
  for i:=ans.l-1 downto 1 do
    begin
      if ans.a[i]<>0 then
      for j:=trunc(ln(ans.a[i])/ln(10))+1 to 5 do
        write(0)
        else for j:=1 to 5 do
               write(0);
      write(ans.a[i]);
    end;
  writeln;
end.
