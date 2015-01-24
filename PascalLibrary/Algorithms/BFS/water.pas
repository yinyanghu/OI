program water;
type atype=record
         father,a,b:word;
     end;
var x,y,z:word;
    data:array[1..10000] of atype;
    ok:array[0..100,0..100] of boolean;

procedure calc;
 var i,j,k,l:word;
     open,closed:integer;

 function min(a,b:word):word;
  begin
      if a<b then min:=a else min:=b;
  end;

 procedure print;
  var i,j:integer;
      d:array[1..10000] of integer;
  begin
      j:=0; i:=closed;
      repeat
         inc(j);
         d[j]:=i;
         i:=data[i].father;
      until i=0;
      for i:=j downto 1 do
        writeln('step',j-i:3,':',data[d[i]].a:5,data[d[i]].b:5);
      readln;
      halt;
  end;

 procedure evaluate(i,j:word);
  begin
      ok[i,j]:=false;
      inc(closed);
      data[closed].a:=i;
      data[closed].b:=j;
      data[closed].father:=open;
      if j=z then print;
  end;

 begin
     fillchar(ok,sizeof(ok),true);
     open:=0; closed:=1; ok[x,0]:=false;
     data[1].a:=x;
     data[1].b:=0;
     data[1].father:=0;
     if (z=x) or (z=0) then print;
     repeat
        inc(open);
        i:=data[open].a;
        j:=data[open].b;
        k:=min(i,y-j);
        l:=min(x-i,j);
        if (i>0) and (j<y) and (ok[i-k,j+k]) then evaluate(i-k,j+k);
        if (j>0) and (i<x) and (ok[i+L,j-L]) then evaluate(i+L,j-L);
        if (i>0) and (ok[0,j]) then evaluate(0,j);
        if (j>0) and (ok[i,0]) then evaluate(i,0);
        if (i<x) and (ok[x,j]) then evaluate(x,j);
        if (j<y) and (ok[i,y]) then evaluate(i,y);
      until open>=closed;
      writeln('No Answer!');
      readln;
 end;

begin
    readln(x,y,z);
    calc;
end.
