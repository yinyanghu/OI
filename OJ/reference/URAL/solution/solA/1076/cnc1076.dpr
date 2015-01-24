 Program Ural1076(Input,Output);
 Const
      MaxN=150;
      MaxNode=MaxN*2+2;
      MaxEdge=(MaxN*MaxN+MaxN*2)*2;
      MinValue=-10000;
 Type
      IntTypeNum1=Longint;
      IntTypeNum2=Integer;
      IntTypeNum3=Shortint;
      OneEdgeType=Record
          St,En,Rev,Len:IntTypeNum2;
          Flow,Cost:IntTypeNum3;
        end;
      EdgeType=array [0..MaxEdge] of OneEdgeType;
      DistanceType=array [1..MaxNode] of IntTypeNum1;
 Var
      n,e,S:IntTypeNum1;
      Edge:EdgeType;
      Dist,Pre:DistanceType;
 Procedure InsertEdge(x,y,W:IntTypeNum1);
    begin
      inc(e);
      With Edge[e] do
        begin
          St:=x;
          En:=y;
          Cost:=W;
        end;
      inc(e);  
      With Edge[e] do
        begin
          St:=y;
          En:=x;
          Cost:=W;
        end;
    end;
 Procedure Init;
    var
      y,z,TempVal:IntTypeNum1;
    begin
      readln(n);
      e:=0;
      Fillchar(Edge,Sizeof(Edge),0);
      for z:=1 to n do InsertEdge(1,z+1,0);
      for y:=1 to n do
        begin
          for z:=1 to n do
            begin
              read(TempVal);
              InsertEdge(y+1,z+1+n,TempVal);
              inc(S,TempVal);
            end;
          readln;
        end;
      for z:=1 to n do InsertEdge(z+n+1,n*2+2,0);
    end;
 Procedure QKSORT(Left,Right:IntTypeNum1);
    var
      l1,r1,Mid1,Mid2:IntTypeNum1;
    begin
      l1:=Left;
      r1:=Right;
      Mid1:=Edge[(Left+Right) div 2].St;
      Mid2:=Edge[(Left+Right) div 2].En;
      Repeat
        While (Edge[l1].St<Mid1) or
             ((Edge[l1].St=Mid1) and (Edge[l1].En<Mid2)) do inc(l1);
        While (Edge[r1].St>Mid1) or
             ((Edge[r1].St=Mid1) and (Edge[r1].En>Mid2)) do dec(r1);
        if l1<=r1 then
          begin
            Edge[0]:=Edge[l1];
            Edge[l1]:=Edge[r1];
            Edge[r1]:=Edge[0];
            inc(l1);
            dec(r1);
          end;
      Until l1>r1;
      if Left<r1 then QKSORT(Left,r1);
      if l1<Right then QKSORT(l1,Right);
    end;
 Procedure FindReverse(No:IntTypeNum1);
    var
      Left,Right,Mid:IntTypeNum1;
    begin
      Left:=1;
      Right:=e+1;
      Edge[No].Rev:=0;
      Repeat
        Mid:=(Left+Right) div 2;
        if (Edge[Mid].St=Edge[No].En) and (Edge[Mid].En=Edge[No].St) then
          begin
            Edge[No].Rev:=Mid;
            Break;
          end;
        if (Edge[Mid].St<Edge[No].En) or
          ((Edge[Mid].St=Edge[No].En) and (Edge[Mid].En<Edge[No].St)) then
            Left:=Mid
          else Right:=Mid;
      Until False;
    end;
 Procedure Main;
    var
      i,Total,MaxFlow,Temp:IntTypeNum1;
      Found:Boolean;
    begin
      QKSORT(1,e);
      for i:=1 to e do FindReverse(i);
      n:=n*2+2;
      Total:=0;
      MaxFlow:=0;
      Repeat
        inc(MaxFlow);
        for i:=1 to e do
          if (Edge[i].St<Edge[i].En) and (Edge[i].Flow=0) then
              Edge[i].Len:=Edge[i].Cost
            else if (Edge[i].St>Edge[i].En) and (Edge[i].Flow=1) then
                     Edge[i].Len:=-Edge[i].Cost
                   else Edge[i].Len:=MinValue;
        Dist[1]:=0;
        for i:=2 to n*2+2 do Dist[i]:=MinValue;
        Repeat
          Found:=False;
          for i:=1 to e do
            begin
              Temp:=Dist[Edge[i].St]+Edge[i].Len;
              if Temp>Dist[Edge[i].En] then
                begin
                  Pre[Edge[i].En]:=i;
                  Dist[Edge[i].En]:=Temp;
                  Found:=True;
                end;
            end;
        Until not Found;
        inc(Total,Dist[n]);
        Temp:=n;
        Repeat
          if Edge[Pre[Temp]].St<Temp then
            begin
              inc(Edge[Pre[Temp]].Flow);
              inc(Edge[Edge[Pre[Temp]].Rev].Flow);
            end
            else
              begin
                dec(Edge[Pre[Temp]].Flow);
                dec(Edge[Edge[Pre[Temp]].Rev].Flow);
              end;
          Temp:=Edge[Pre[Temp]].St;
        Until Temp=1;
      Until MaxFlow=(n-2) div 2;
      writeln(S-Total);
    end;
 Begin
{$IFNDEF ONLINE_JUDGE}
	Assign(Input,'is.txt');
	Reset(Input);
	Assign(Output,'o.txt');
	Rewrite(Output);
{$ENDIF}
	Main;
{$IFNDEF ONLINE_JUDGE}
	Close(Input);
	Close(Output);
{$ENDIF}
 End.