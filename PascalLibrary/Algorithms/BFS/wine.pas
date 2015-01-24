program wine;
type
   atype=record
       father,a,b,c,r1,r2,r3,r4:word;
   end;
   btype=array[0..18,0..18,0..13,0..10,0..14,0..14,0..14] of boolean;
var
  x,y,z:word;
  data:array[1..10000] of atype;
  ok:^btype;

procedure calc;
 var a1,a2,a3,a4,a5,a6,a7,ai,j,k,l:word;
     b1,b2,b3,b4,b5,b6:word;
     open,closed:longint;

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
         i:=data[i].father
      until i=0;
      for i:=j downto 1 do
        writeln('step',j-i:3,':',data[d[i]].a:5,data[d[i]].b:5,
         data[d[i]].c:5,data[d[i]].r1:5,data[d[i]].r2:5,
          data[d[i]].r3:5,data[d[i]].r4:5);
      close(output);
      halt;
  end;

  procedure evaluate(a1,a2,a3,a4,a5,a6,a7:word);
   begin
       ok^[a1,a2,a3,a4,a5,a6,a7]:=false;
       inc(closed);
       data[closed].a:=a1;
       data[closed].b:=a2;
       data[closed].c:=a3;
       data[closed].r1:=a4;
       data[closed].r2:=a5;
       data[closed].r3:=a6;
       data[closed].r4:=a7;
       data[closed].father:=open;
       if (a4=4) and (a5=4) and (a6=4)and (a7=4) then print;
   end;

 begin
     new(ok);
     fillchar(ok^,sizeof(ok^),true);
     open:=0; closed:=1;
     ok^[x,y,z,0,0,0,0]:=false;
     data[1].a:=x;
     data[1].b:=y;
     data[1].c:=z;
     data[1].r1:=0;
     data[1].r2:=0;
     data[1].r3:=0;
     data[1].r4:=0;
     data[1].father:=0;
     repeat
       inc(open);
       a1:=data[open].a;
       a2:=data[open].b;
       a3:=data[open].c;
       a4:=data[open].r1;
       a5:=data[open].r2;
       a6:=data[open].r3;
       a7:=data[open].r4;
       b1:=min(a1,8-a2);
       b2:=min(a1,3-a3);
       b3:=min(a2,8-a1);
       b4:=min(a2,3-a3);
       b5:=min(a3,8-a1);
       b6:=min(a3,8-a2);
       if (a1>0) and (a2<8) and (ok^[a1-b1,a2+b1,a3,a4,a5,a6,a7]) then evaluate(a1-b1,a2+b1,a3,a4,a5,a6,a7);
       if (a1>0) and (a3<3) and (ok^[a1-b2,a2,a3+b2,a4,a5,a6,a7]) then evaluate(a1-b2,a2,a3+b2,a4,a5,a6,a7);
       if (a2>0) and (a1<8) and (ok^[a1+b3,a2-b3,a3,a4,a5,a6,a7]) then evaluate(a1+b3,a2-b3,a3,a4,a5,a6,a7);
       if (a2>0) and (a3<3) and (ok^[a1,a2-b4,a3+b4,a4,a5,a6,a7]) then evaluate(a1,a2-b4,a3+b4,a4,a5,a6,a7);
       if (a3>0) and (a1<8) and (ok^[a1+b5,a2,a3-b5,a4,a5,a6,a7]) then evaluate(a1+b5,a2,a3-b5,a4,a5,a6,a7);
       if (a3>0) and (a2<8) and (ok^[a1,a2+b6,a3-b6,a4,a5,a6,a7]) then evaluate(a1,a2+b6,a3-b6,a4,a5,a6,a7);
       if (a1>0) and (a1<5) and (a1+a4<5) and (ok^[0,a2,a3,a1+a4,a5,a6,a7]) then evaluate(0,a2,a3,a1+a4,a5,a6,a7);
       if (a1>0) and (a1<5) and (a1+a5<5) and (ok^[0,a2,a3,a4,a1+a5,a6,a7]) then evaluate(0,a2,a3,a4,a1+a5,a6,a7);
       if (a1>0) and (a1<5) and (a1+a6<5) and (ok^[0,a2,a3,a4,a5,a1+a6,a7]) then evaluate(0,a2,a3,a4,a5,a1+a6,a7);
       if (a1>0) and (a1<5) and (a1+a7<5) and (ok^[0,a2,a3,a4,a5,a6,a1+a7]) then evaluate(0,a2,a3,a4,a5,a6,a1+a7);
       if (a2>0) and (a2<5) and (a2+a4<5) and (ok^[a1,0,a3,a2+a4,a5,a6,a7]) then evaluate(a1,0,a3,a2+a4,a5,a6,a7);
       if (a2>0) and (a2<5) and (a2+a5<5) and (ok^[a1,0,a3,a4,a2+a5,a6,a7]) then evaluate(a1,0,a3,a4,a2+a5,a6,a7);
       if (a2>0) and (a2<5) and (a2+a6<5) and (ok^[a1,0,a3,a4,a5,a2+a6,a7]) then evaluate(a1,0,a3,a4,a5,a2+a6,a7);
       if (a2>0) and (a2<5) and (a2+a7<5) and (ok^[a1,0,a3,a4,a5,a6,a2+a7]) then evaluate(a1,0,a3,a4,a5,a6,a2+a7);
       if (a3>0) and (a3<5) and (a3+a4<5) and (ok^[a1,a2,0,a3+a4,a5,a6,a7]) then evaluate(a1,a2,0,a3+a4,a5,a6,a7);
       if (a3>0) and (a3<5) and (a3+a5<5) and (ok^[a1,a2,0,a4,a3+a5,a6,a7]) then evaluate(a1,a2,0,a4,a3+a5,a6,a7);
       if (a3>0) and (a3<5) and (a3+a6<5) and (ok^[a1,a2,0,a4,a5,a3+a6,a7]) then evaluate(a1,a2,0,a4,a5,a3+a6,a7);
       if (a3>0) and (a3<5) and (a3+a7<5) and (ok^[a1,a2,0,a4,a5,a6,a3+a7]) then evaluate(a1,a2,0,a4,a5,a6,a3+a7);
     until open>=closed;
     writeln('No answer');
 end;

begin
    assign(input,'wine.in'); reset(input);
    readln(x,y,z);
    close(input);
    assign(output,'wine.out'); rewrite(output);
    calc;
    close(output);
end.
