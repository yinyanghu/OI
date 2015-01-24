//Written on 6175 -- Mar 23, 2005
program scubadiv;
const
  maxoxy=21;
  maxnit=79;
  inf=999999;
var
  weight:array[0..maxoxy,0..maxnit]of longint;
  t,u,needoxy,neednit,moxy,mnit,n,k,i,j,oxy,nit,toxy,tnit,w,tw:longint;
begin
  read(t);
  for u:=1 to t do begin
    read(needoxy,neednit,n);moxy:=0;mnit:=0;
    for i:=0 to needoxy do
      for j:=0 to neednit do
        weight[i,j]:=inf;
    weight[0,0]:=0;
    for k:=1 to n do begin
      read(oxy,nit,w);
      for i:=moxy downto 0 do begin
        toxy:=i+oxy;if toxy>needoxy then toxy:=needoxy;
        for j:=mnit downto 0 do begin
          if weight[i,j]=inf then continue;
          tnit:=j+nit;if tnit>neednit then tnit:=neednit;
          tw:=weight[i,j]+w;
          if tw<weight[toxy,tnit] then weight[toxy,tnit]:=tw;
        end;
      end;
      inc(moxy,oxy);if moxy>needoxy then moxy:=needoxy;
      inc(mnit,nit);if mnit>neednit then mnit:=neednit;
    end;
    writeln(weight[needoxy,neednit]);
  end;
end.
