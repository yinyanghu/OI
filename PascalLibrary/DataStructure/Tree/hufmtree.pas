program hufmtree;
type node=record
         data:integer;
         prt,l,r,len:integer;
     end;
     wtype=array[1..1000] of integer;
     treetype=array[1..2000] of node;

var tree:treetype;
    bt:integer;
    w:wtype;
    n,m,i:integer;

procedure hufm(w:wtype; var tree:treetype; var bt:integer);
 function min(h:integer):integer;
  var m1,i,p:integer;
  begin
      m1:=maxint;
      for i:=1 to h do
        if (tree[i].prt=0) and (m1>tree[i].data) then begin
            p:=i; m1:=tree[i].data;
        end;
      min:=p;
  end;
 var i,j,k:integer;
 begin
     fillchar(tree,sizeof(tree),0);
     for i:=1 to n do tree[i].data:=w[i];
     for k:=n+1 to m do begin
         i:=min(k-1); tree[i].prt:=k; tree[k].l:=i;
         j:=min(k-1); tree[j].prt:=k; tree[k].r:=j;
         tree[k].data:=tree[i].data+tree[j].data;
     end;
     bt:=m;
 end;

procedure ht(t:integer);
 begin
     if t=m then tree[t].len:=0
       else tree[t].len:=tree[tree[t].prt].len+1;
     if tree[t].l<>0 then begin
         ht(tree[t].l);
         ht(tree[t].r);
     end;
 end;

begin
    readln(n);
    m:=n*2-1;
    for i:=1 to n do read(w[i]);
    hufm(w,tree,bt);
    ht(bt);
    writeln(tree[bt].data);
    for i:=1 to n do write(tree[i].len*tree[i].data,'  ');
end.