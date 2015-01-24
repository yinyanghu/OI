program ural1003;
const
  bigprime=65521;
var
  data:array[0..bigprime-1]of longint;
  root:array[0..bigprime-1]of word;
  dif:array[0..bigprime-1]of boolean;
  n,i,x,y,ans:longint;
  c:char;
  rel:boolean;
function hash(x:longint):word;
  var
    t:word;
  begin
    t:=x mod bigprime;
    while (data[t]>=0) and (data[t]<>x) do t:=(t+1) mod bigprime;
    data[t]:=x;hash:=t;
  end;
procedure pathcomp(x:word);
  var
    r,t:word;
    d,e:boolean;
  begin
    r:=x;d:=false;while root[r]<>r do begin d:=d xor dif[r];r:=root[r];end;
    while x<>r do begin
      e:=d xor dif[x];dif[x]:=d;d:=e;
      t:=root[x];root[x]:=r;x:=t;
    end;
  end;
begin
//{$}assign(input,'1003.in');reset(input);
  repeat
    read(n);if n<0 then halt;
    fillchar(data,sizeof(data),255);
    for i:=0 to bigprime-1 do root[i]:=i;
    fillchar(dif,sizeof(dif),0);

    read(n);ans:=n;
    for i:=1 to n do begin
      readln(x,y,c,c);dec(x);rel:=c='o';
      x:=hash(x);y:=hash(y);
      pathcomp(x);pathcomp(y);
      if root[x]<>root[y] then begin
        dif[root[x]]:=rel xor dif[x] xor dif[y];
        root[root[x]]:=root[y];
      end
      else
        if dif[x] xor dif[y]<>rel then begin
          ans:=i-1;break;
        end;
    end;
    for i:=ans+2 to n do readln;
    writeln(ans);
  until false;
end.
